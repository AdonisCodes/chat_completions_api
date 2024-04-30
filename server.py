
from flask import Flask, request, Response
import requests
import uuid

app = Flask(__name__)

LOCAL_API_URL = "http://localhost:11434"
API_KEY = "SUPER_SECRET_API_KEY"
HOST_HEADER = "localhost:11434"  # Change this to your desired Host header value

@app.route('/', defaults={'path': ''}, methods=['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'])
@app.route('/<path:path>', methods=['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'])
def proxy(path):
    # Extract request headers
    if 'Authorization' not in request.headers:
        return Response("Unauthorized", status=401)
    if request.headers['Authorization'] != str(API_KEY):
        return Response("Unauthorized", status=401)

    headers = dict(request.headers)
    headers['Host'] = HOST_HEADER

    # Forward request to local API
    response = requests.request(
        method=request.method,
        url=f"{LOCAL_API_URL}/{path}",
        headers=headers,
        data=request.get_data(),
        cookies=request.cookies,
        allow_redirects=False
    )

    # Forward response from local API to client
    return Response(
        response=response.content,
        status=response.status_code,
        headers=response.headers.items()
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=2228)  # Change port as needed
