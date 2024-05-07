echo ""
echo "----------------------------------------------"
echo "--- OLLAMA: One Line Localhost API Manager ---"
echo "  OLLAMA: Checking if Daemon already exists"
if test -f ~/Library/LaunchAgents/com.simonferns.olla.ollama_api_startup_expose.plist; then
    echo "  OLLAMA: Daemon already exists"
else
    echo "  OLLAMA: Daemon does not exist"
    echo "  OLLAMA: Creating Daemon"
    cp com.simonferns.olla.ollama_api_startup_expose.plist ~/Library/LaunchAgents/
    echo "  OLLAMA: Daemon created"
fi

# Check if the Service is registered as a Login Item
echo "  OLLAMA: Checking if the Service is registered as a Login Item"
if [[ $(launchctl list | grep com.simonferns.olla.ollama_api_startup_expose | awk '{print $1}') =~ ^[0-9]+$ ]]; then
    echo "  OLLAMA: Great Job! Service is already running!"
else
    echo "  OLLAMA: Service is not running"
    launchctl unload ~/Library/LaunchAgents/com.simonferns.olla.ollama_api_startup_expose.plist
    launchctl load ~/Library/LaunchAgents/com.simonferns.olla.ollama_api_startup_expose.plist
fi

echo "  OLLAMA: Checking Service Status"
# Check if the http response from 0.0.0.0:11434 is greater than 0 chars
response=$(curl -s http://0.0.0.0:11434/api/tags)
if [ $(echo "$response" | wc -c) -gt 0 ]; then
    echo "  $response"
    echo "  OLLAMA: Service is running!"
else
    echo "  OLLAMA: Service is not running!"
fi
echo "  OLLAMA: Done"
echo "----------------------------------------------"
