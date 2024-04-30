
echo "Checking if olm is installed..."
if ollama -h  &> /dev/null; then
  echo "Ollama is installed!"
else
  echo "Please follow the official ollama docs to get started!"
  exit 1
fi

# Now install all the models
echo "Installing models..."
echo "Pulling llama3..."
ollama pull llama3
echo "Pulling llava..."
ollama pull llava
echo "You can now continue with the documentation to get started!"
