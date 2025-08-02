if status is-interactive
    # Commands to run in interactive sessions can go here
end
#bass source ~/.profile

# Created by `pipx` on 2024-12-06 14:28:43
set PATH $PATH /home/klojewski/.local/bin

if test -f ~/.ai_api_key
  set -x AI_API_KEY (cat ~/.ai_api_key)
end
