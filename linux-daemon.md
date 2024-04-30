### Linux Daemon Configuration

#### 1. Copy Daemon File

Move the provided `daemon.service` file to the `/etc/systemd/system` directory.

```bash
sudo cp daemon.service /etc/systemd/system/ollama_proxy.service
```

#### 2. Create Directory and Move Script

Create a directory called `.ollama_proxy` in your home directory and move the `server.py` script to this directory.

```bash
mkdir ~/.ollama_proxy
cp server.py ~/.ollama_proxy/
```

#### 3. Start the Daemon

Start the Ollama Proxy daemon using the following command:

```bash
sudo systemctl start ollama_proxy
```

#### 4. Enable Auto-Start (Optional)

To enable the Ollama Proxy daemon to start automatically on system boot, run the following command:

```bash
sudo systemctl enable ollama_proxy
```

#### 5. Check Status

You can check the status of the Ollama Proxy daemon to ensure it's running without errors:

```bash
sudo systemctl status ollama_proxy
```

### Testing

After starting the daemon, you can test the Ollama Proxy by sending requests to port 2228 on your server's IP address. Make sure to include the API key in the Authorization header.

### Example:

```bash
curl -X GET http://your_server_ip:2228/path -H "Authorization: YOUR_API_KEY"
```

That's it! Ollama Proxy is now set up and running on your Linux system. If you encounter any issues during setup, feel free to reach out for assistance.
