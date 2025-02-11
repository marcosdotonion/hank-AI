#!/bin/bash

    echo "Hank0.2.2 Fullbuild project 0.1 Nominal."
    espeak-ng -g 0.4 -p 0.02 -s 180 "Hank0.2.2 Fullbuild project 0.1 Nominal."


# Define file paths
memory_file="./memory.json"
output_file="./output.md"

    #verifications
    echo "verifying now..."; espeak-ng -p 100 -s 200 "verifying now..."

# Check if the memory.json file exists
if [[ -f "$memory_file" ]]; then
    # Read the content of memory
    memory=$(cat "$memory_file")
    echo "memory ok."; espeak-ng -p 100 -s 200 "memory ok."
    
    echo "for new features, please check line 21."; espeak-ng  -p 100 -s 200 "for new features, please check line 21."
    clear

echo "Hello, I'm Hank."; espeak-ng -g 0.4 -p 20 -s 180 "Hello, I'm Hank."

    #START OF LOOP
while true; do
        # Ask the user for input
        echo "(BASH)Hank 0.2.2 Fullbuild project 0.1. Type 'exit' to quit."
        read -p "command-line: " user_input;
         #CHECK IF THE USER WANTS TO EXIT
        if [[ "$user_input" == "exit" ]]; then
        echo "See ya!"
        break
        fi
        # Create a prompt for Ollama using the memory and the user input
        full_prompt="Memory:\n$memory\n\nInstruction: $user_input"

        # Run Ollama with the memory and user input
        response=$(ollama run hank0.2.2 "$full_prompt")

        # Clean the response by removing <think></think> parts (including multiline content)
        clean_response=$(echo "$response" | sed -e '/<think>/,/<\/think>/d')

        # Append the cleaned response to output.md
        echo -e "$clean_response" >> "$output_file"

        # Inform the user that the response has been saved
        #echo "The response has been saved to $output_file."

        # Use espeak-ng to convert the cleaned response to speech
        espeak-ng -g 0.4 -p 20 -s 180 "$clean_response"
    done
else
    echo "Error: $memory_file not found!"
fi
