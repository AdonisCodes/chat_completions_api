echo ""
echo "----------------------------------------------"
echo "--- OpenWebUI: One Line Localhost API Manager ---"
echo "  OpenWebUI: Checking if Daemon already exists"

CONTAINER_NAME="open-webui"

if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
  echo "  OpenWebUI: Daemon is already running 🎉"
else
  # Check if the container exists
  if [ $(docker ps -aq -f name=$CONTAINER_NAME) ]; then
    docker start $CONTAINER_NAME
  else
    # Get user input for a specific url
    ollama_url=""
    while [ -z "$ollama_url" ]; do
      echo "  OpenWebUI: Enter the URL you want to manage(Including the port):"
      read ollama_url
    done

    # Run the container
    echo "  OpenWebUI: Running the Daemon"
    docker run -d -p 3000:8080 -e OLLAMA_BASE_URL=$ollama_url -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
  fi
fi

echo "  OpenWebUI: Testing API Service"
response=$(curl -s http://0.0.0.0:3000)
if [ $(echo "$response" | wc -c) -gt 0 ]; then
    echo "  OpenWebUI: Service is running!"
else
    echo "  OpenWebUI: Service is not running!"
fi

echo "----------------------------------------------"
echo ""
