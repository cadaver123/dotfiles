function rgfzf
    set selected_file (rg -l -g "$argv[1]" -i "$argv[2]" |  awk -F/ '{
                   if (NF > 4) {
                       print ".../" $(NF-3) "/" $(NF-2) "/" $(NF-1) "/" $NF "\t" $0
                   } else {
                       print $0 "\t" $0
                   }
               }' | fzf --delimiter='\t' --with-nth=1 \
             --preview "batcat --color=always --style=numbers {2} | rg --color=always  --colors match:bg:red --colors match:style:bold -C 4 -i '$argv[2]'" \
                | cut -f2)

    if test -n "$selected_file"
        set dir (dirname "$selected_file")

        echo "Selected file: $selected_file"
        echo "Choose action:"
        echo "1. Open in Vim"
        echo "2. Change directory to $dir"
        echo "3. Grep pattern in the file"
        read -P "Enter choice [1/3]: " choice

        switch "$choice"
            case 1
                vim "$selected_file"
            case 2
                cd "$dir"
                echo "Changed directory to $dir"
            case 3
                grep -n -i "$argv[2]" "$selected_file"
        end
    else
        echo "No file selected."
    end
end
