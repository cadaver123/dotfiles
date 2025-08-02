function rgfzf
    rg -l -g "$argv[1]" -i "$argv[2]" | fzf --preview "batcat --style=numbers --color=always {} 2>/dev/null | rg --colors 'match:fg:yellow' --colors 'match:style:bold' --context 10 '$argv[2]' || batcat --style=numbers --color=always {}" | xargs -ro nvim
end
