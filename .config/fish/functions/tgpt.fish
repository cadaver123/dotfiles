function tgpt --description 'alias tgpt=tgpt --url https://api.mistral.ai/v1/chat/completions '
    command tgpt --url https://api.mistral.ai/v1/chat/completions --preprompt "Please try to be short in answers" --provider ollama --model mistral-medium-latest -q $argv

end
