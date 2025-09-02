function find_commits_rec
    set -l author $argv[1]
    set -l since $argv[2]
    set -l until $argv[3]

    find . -maxdepth 2 -type d -name .git | while read -l gitdir
        cd "$gitdir/.." || return
        for branch in main master
            if git show-ref --verify --quiet refs/heads/$branch
                set commits (git log --author=$author --oneline --pretty=format:"%h - %ad : %s" --since=$since --until=$until $branch)
                if test -n "$commits"
                    echo "Repository: $(pwd)"
                    for commit in $commits
                        echo $commit
                    end
                end
                break
            end
        end
        cd - > /dev/null || return
    end
end

