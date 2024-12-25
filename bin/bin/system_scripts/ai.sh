#!/usr/bin/env zsh

# Script to run LLM models locally or remotely via Groq API

# Set traps for signals if not in a TMUX session
if [ -z "$TMUX" ]; then
    # when exiting switch back to previous workspace
    trap 'exit' INT
    trap 'i3-msg workspace back_and_forth &> /dev/null' EXIT
fi

# Function to handle local AI setup and execution
run_local_ai() {
    # Start the Ollama server in the background
    ollama serve &> /dev/null &
    sleep 1  # Allow the server to initialize

    # Prompt user to select a model
    local model=$(ollama list | tail +2 | fzf --prompt="Select a offline model: " | awk '{print $1}')

    # exit if no model is selected
    if [ -z "$model" ]; then
        exit
    fi

    # Main interaction loop for local AI
    while true; do
        echo -n "($1 -> $model) Enter prompt: "
        read -r prompt
        if [ -z "$prompt" ]; then
            echo "No prompt provided. Exiting."
            exit
        fi
        prompt=${prompt//\"/\'}
        echo -e "($1-> $model) Prompt: $prompt\n" >> ~/ai_output
        stdbuf -oL ollama run "$model" "$prompt" | tee -a ~/ai_output 
        echo -e "\n------------------------------------------------------------------------------------------------------\n" >> ~/ai_output
    done
}

# Function to handle remote AI execution
run_remote_ai() {
    local GROQ_API_KEY=$(cat ~/llm_groq)

    # Prompt user to select a remote model
    local model=$(printf "Gemma-7b-It\nLlama3-70b-8192\nLlama3-8b-8192\nMixtral-8x7b-32768\nLlama-3.1-405b-Reasoning\nLlama-3.1-70b-Versatile\nLlama-3.1-8b-Instant" | fzf --prompt="Select a online model: ")
    if [ -z "$model" ]; then
        exit
    fi

    # Main interaction loop for remote AI
    while true; do
        echo -n "($1 -> $model) Enter prompt: "
        read -r prompt
        if [ -z "$prompt" ]; then
            echo "No prompt provided. Exiting."
            exit
        fi
        prompt=${prompt//\"/\'}
        echo -e "$1-> $model: Prompt: $prompt\n" >> ~/ai_output
        echo -e "\n\n"
        echo $(curl -s -X POST "https://api.groq.com/openai/v1/chat/completions" \
            -H "Authorization: Bearer $GROQ_API_KEY" \
            -H "Content-Type: application/json" \
            -d "{\"messages\": [{\"role\": \"user\", \"content\": \"$prompt\"}], \"model\": \"$model\"}" | \
            jq '.choices[0].message.content' ) | tee -a ~/ai_output | glow -p | cat
        echo -e "\n------------------------------------------------------------------------------------------------------\n" >> ~/ai_output
        echo -e "\n\n"
    done
}

# Main script logic
type_of_ai=$(printf "Online\nOffline" | fzf --prompt="Select AI type: ") || { echo "No type selected. Exiting."; exit; }

if [ "$type_of_ai" = "Offline" ]; then
    run_local_ai $type_of_ai
else
    run_remote_ai $type_of_ai
fi
