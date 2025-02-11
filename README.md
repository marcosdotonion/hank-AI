# Hank 0.3 FB-Alpha

This is a simple interactive program that uses `Ollama` to generate responses based on memory and user input, and saves those responses to a file while also converting them to speech using `espeak-ng`.

## Requirements

- Python 3.x
- Ollama
- espeak-ng
- A memory file (`memory.json`) with pre-existing memory content

## Installation

1. Install Python 3.x if not already installed.
2. Install `Ollama` by following their official setup guide.
3. Install `espeak-ng`:
   - On Debian/Ubuntu: `sudo apt install espeak-ng`
   - On macOS (via Homebrew): `brew install espeak-ng`
4. Place your `memory.json` file in the project directory or create one with initial memory data.

## Usage

1. Clone the repository or copy the script files into your directory.
2. Ensure that the `memory.json` file is present in the directory.
3. Make sure you have a python environment with the needed pip.
4. Run the script:

   ```bash
   python3 app.py
