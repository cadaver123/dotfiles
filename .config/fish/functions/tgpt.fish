function tgpt --description 'alias tgpt=tgpt --url https://api.mistral.ai/v1/chat/completions '
    command tgpt --url https://api.mistral.ai/v1/chat/completions --preprompt "Think carefully before responding. Ensure your answers are accurate, relevant, and as concise as possible. Prioritize clarity and brevity without sacrificing quality. If the question requires depth, focus on the most important details. Always aim to provide value in the fewest words necessary. Please keep your answers really brief" --provider ollama --model mistral-medium-latest -q $argv

end
