echo ""
echo "----------------------------------------------"
echo "--- COMFYUI: One Line Localhost API Manager ---"
echo "  COMFYUI: Checking if Daemon already exists"
if test -f ~/Library/LaunchAgents/com.simonferns.comfy.plist; then
    echo "  COMFYUI: Daemon already exists"
else
    echo "  COMFYUI: Daemon does not exist"
    echo "  COMFYUI: Creating Daemon"
    # REPLACE THE <USERNAME> with your username
    cp com.simonferns.comfy.plist ~/Library/LaunchAgents/
    sed -i '' "s/<USERNAME>/$USER/g" ~/Library/LaunchAgents/com.simonferns.comfy.plist
    echo "  COMFYUI: Daemon created"
fi

# Check if the Service is registered as a Login Item
echo "  COMFYUI: Checking if the Service is registered as a Login Item"
if [[ $(launchctl list | grep com.simonferns.comfy | awk '{print $1}') =~ ^[0-9]+$ ]]; then
    echo "  COMFYUI: Great Job! Service is already running!"
else
    echo "  COMFYUI: Service is not running"
    launchctl unload ~/Library/LaunchAgents/com.simonferns.comfy.plist
    launchctl load ~/Library/LaunchAgents/com.simonferns.comfy.plist
fi

sleep 10;

echo "  COMFYUI: Checking Service Status"
response=$(curl -s http://localhost:8188)
if [ $(echo "$response" | wc -c) -gt 10 ]; then
    echo "  $response"
    echo "  COMFYUI: Service is running!"
else
    echo "  COMFYUI: Service is not running!"
fi
echo "  COMFYUI: Done"
echo "----------------------------------------------"
