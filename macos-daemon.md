### Setting Up Ollama Proxy on macOS

#### 1. Copy Daemon File

```bash
sudo cp daemon.plist /Library/LaunchDaemons/ollama_proxy.plist
```

This command copies the provided `daemon.plist` file to the correct location for launch daemons.

#### 2. Create Directory and Move Script

```bash
mkdir ~/.ollama_proxy
cp server.py ~/.ollama_proxy/
```

These commands create a directory called `.ollama_proxy` in your home directory and move the `server.py` script into it.

#### 3. Start the Daemon

```bash
launchctl load /Library/LaunchDaemons/ollama_proxy.plist
```

This command loads the Ollama Proxy daemon specified in the `ollama_proxy.plist` file.

#### 4. Restart your computer

Restart your computer to ensure the Ollama Proxy daemon starts automatically on boot and to verify that the server is still up and running.

### Testing

After restarting your computer, you can test the Ollama Proxy by sending requests to port 2228 on your server's IP address. Make sure to include the API key in the Authorization header.

### Example:

```bash
curl -X GET http://your_server_ip:2228/path -H "Authorization: YOUR_API_KEY"
```

That's it! Ollama Proxy is now set up and running on your macOS system. If you encounter any issues during setup, feel free to reach out for assistance.. Restart your computer & see if the server is still up and running!
