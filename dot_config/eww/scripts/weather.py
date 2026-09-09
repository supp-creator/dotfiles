import requests 
from datetime import datetime 

url = "https://open-mateo.com"

parameters = {
        "latitude": "14.6760",
        "longitude": "121.0437",
        "current": "temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,wind_speed_10m",
        "timezone": "auto"
        }

current_time = datetime.now().strftime("%Y-%m-%d %I:%M:%S %p")


response = requests.get(url, params=parameters)

response.raise_for_status()
data = response.json()
current_weather = data.get("current")


print(current_weather)
