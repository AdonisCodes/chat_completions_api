# Ollama Persistent Proxy

You should have all the required packages & libraries installed as listed below:
- ollama (Can be found on the ollama documentation on github)
- python3 (Python 3.8+)

1. Run `python3 -m venv venv ; source venv/bin/activate ; pip install -r requirements.txt`
2. Start the server to see if it works locallly by visiting `http://localhost:2228/api/tags` (Should give you an unauthorized error)
3. Change the super seceret api-key to prevent anyone else from accessing it.
4. Create a login item by using the `daemon.service` or the `macos-daemon.sh` script via the login-settings / systemd commands
5. Restart your computer to see if it still works
6. Expose the port in your router (You can do this with a youtube tutorial) <-- Also ensure you make your computer have a static internal ip
7. Use something like duckdns to your ip be masked by a nice *.duckdns.org url, you can also use a systemctl/systemd script to auto update your ip addr
8. Enjoy using the api via the offical ollama python package / openai package

