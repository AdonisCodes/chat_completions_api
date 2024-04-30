launchctl unload ~/Library/LaunchAgents/com.simonferns.olla.ollama_api_startup_expose.plist
launchctl load ~/Library/LaunchAgents/com.simonferns.olla.ollama_api_startup_expose.plist

launchctl list | grep com.simonferns.olla.ollama_api_startup_expose

