import os
import subprocess

# Define file paths
memory_file = "./memory.json"
output_file = "./output.md"

# Check if the memory.json file exists
if os.path.isfile(memory_file):
    # Read the content of memory
    with open(memory_file, "r") as file:
        memory = file.read()

    # Start a loop for continuous interaction
    while True:
        # Ask the user for input
        user_input = input("Hank 0.3 FB-Alpha. Type 'exit' to quit. ")

        # Check if the user wants to exit
        if user_input.lower() == "exit":
            print("Goodbye!")
            break

        # Create a prompt for Ollama using the memory and the user input
        full_prompt = f"Memory:\n{memory}\n\nInstruction: {user_input}"

        # Run Ollama with the memory and user input
        response = subprocess.run(
            ["ollama", "run", "hank0.3", full_prompt],
            capture_output=True,
            text=True
        ).stdout

        # Clean the response by removing <think></think> parts (including multiline content)
        import re
        clean_response = re.sub(r"<think>.*?</think>", "", response, flags=re.DOTALL).strip()

        # Append the cleaned response to output.md
        with open(output_file, "a") as file:
            file.write(clean_response + "\n")

        # Inform the user that the response has been saved
        print("The response has been saved to", output_file)

        # Use espeak-ng to convert the cleaned response to speech
        print(clean_response)
        subprocess.run(["espeak-ng", clean_response])
else:
    print(f"Error: {memory_file} not found!")
