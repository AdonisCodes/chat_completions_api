echo ""
echo "----------------------------------------------"
echo "--- COMFYUI: One Line Localhost API Manager ---"
echo "  COMFYUI: Checking if Daemon already exists"
if test -f ~/Library/LaunchAgents/com.simonferns.comfy.comfy_ui_api_start_expose.plist; then
    echo "  COMFYUI: Daemon already exists"
else
    echo "  COMFYUI: Daemon does not exist"
    echo "  COMFYUI: Creating Daemon"
    cp com.simonferns.comfy.comfy_ui_api_start_expose.plist ~/Library/LaunchAgents/
    echo "  COMFYUI: Daemon created"
fi

# Check if the Service is registered as a Login Item
echo "  COMFYUI: Checking if the Service is registered as a Login Item"
if [[ $(launchctl list | grep com.simonferns.olla.ollama_api_startup_expose | awk '{print $1}') =~ ^[0-9]+$ ]]; then
    echo "  COMFYUI: Great Job! Service is already running!"
else
    echo "  COMFYUI: Service is not running"
    launchctl unload ~/Library/LaunchAgents/com.simonferns.comfy.comfy_ui_api_start_expose.plist
    launchctl load ~/Library/LaunchAgents/com.simonferns.comfy.comfy_ui_api_start_expose.plist
fi

echo "  COMFYUI: Checking Service Status"
# Check if the http response from 0.0.0.0:11434 is greater than 0 chars
response=$(curl -s http://0.0.0.0:8188)
if [ $(echo "$response" | wc -c) -gt 10 ]; then
    echo "  $response"
    echo "  COMFYUI: Service is running!"
else
    echo "  COMFYUI: Service is not running!"
fi
echo "  COMFYUI: Done"
echo "----------------------------------------------"
