function pull_changes
    # Iterate over each directory containing a .git folder
    find . -maxdepth 2 -type d -name ".git" | while read -l gitdir
        cd "$gitdir/.." || return

        # Check if the current directory has a main or master branch
        for branch in main master
            if git show-ref --verify --quiet refs/heads/$branch
                echo "Pulling changes for branch $branch in repository: $(pwd)"
                git pull origin $branch
            end
        end

        # Return to the original directory
        cd - > /dev/null || return
    end
end
