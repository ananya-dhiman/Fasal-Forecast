import requests


def get_location():
    # sending request to ipinfo.io to get location data
    response = requests.get('https://ipinfo.io')

    if response.status_code == 200:
        print(f"{response=}")
        data = response.json()
        print(f"{data=}")
        location = data.get('loc')
        city = data.get('city')
        region = data.get('region')
        print(f"{location=}")# Returns 'lat,lng' as a string

        if location:
            latitude, longitude = location.split(',')
            return float(latitude), float(longitude), str(city), str(region)
        else:
            return None
    else:
        return None


def get_weather_data(lat, lon, api_key):
    # URL for OpenWeatherMap API with specified latitude and longitude
    url = f"http://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={api_key}&units=metric"

    # Sending GET request to OpenWeatherMap API
    response = requests.get(url)

    # If the request was successful
    if response.status_code == 200:
        data = response.json()
        return data
    else:
        return f"Error: Unable to fetch data (Status code: {response.status_code})"


# Example usage
def get_data():
    location = get_location()
    if location:
        print(f"Latitude: {location[0]}, Longitude: {location[1]}, City: {location[2]}")
    else:
        print("Could not retrieve location")
    latitude = location[0]  # Replace with the latitude you want to query
    longitude = location[1]  # Replace with the longitude you want to query
    api_key = "5121b5175e1e47be62df471453167da2"  # Replace with your actual API key

    weather_data = get_weather_data(latitude, longitude, api_key)
    # print(weather_data)
    needed_data = [weather_data.get('main', {}).get('temp_min'), weather_data.get('main', {}).get('temp_max'), weather_data.get('main', {}).get('humidity'), weather_data.get('wind', {}).get('speed')]
    # print(needed_data)
    return {'temp_min':needed_data[0], 'temp_max':needed_data[1], 'humidity':needed_data[2], 'wind_speed':needed_data[3],  'city':location[2], 'region':location[3]}