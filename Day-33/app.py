import requests

response = requests.get("https://example.com")

print("Status:", response.status_code)
print("Dockerized Python application is working!")
