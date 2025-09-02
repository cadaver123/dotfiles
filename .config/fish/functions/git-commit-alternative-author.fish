function git-commit-alternative-author
    set -l config "$HOME/.git-alternative-author"

    if not test -f $config
        echo "Error: $config not found!" >&2
        return 1
    end

    set -l NAME
    set -l EMAIL

    while read -l line
        if string match -q "name=*" $line
            set NAME (string replace "name=" "" -- $line)
        else if string match -q "email=*" $line
            set EMAIL (string replace "email=" "" -- $line)
        end
    end < $config

    if test -z "$NAME"
        echo "Error: No name found in $config" >&2
        return 1
    end

    if test -z "$EMAIL"
        echo "Error: No email found in $config" >&2
        return 1
    end

    env GIT_AUTHOR_NAME="$NAME" \
        GIT_AUTHOR_EMAIL="$EMAIL" \
        GIT_COMMITTER_NAME="$NAME" \
        GIT_COMMITTER_EMAIL="$EMAIL" \
        git commit $argv
end
