# RazorERP Weather App

## Overview

The RazorERP Weather App provides a 5-day weather forecast based on the user's current location. It uses the OpenWeatherMap API to fetch weather data and displays it in a user-friendly format. The app is designed to be responsive, supporting both horizontal and vertical orientations.

## Key Technologies and Plugins

- **Dio**: For making API calls with an API key as an interceptor.
- **Bloc**: For state management.
- **Built Value**: For JSON deserialization.
- **Hydrated Bloc**: For persisting and retrieving the last state, allowing offline access.
- **Geolocator**: For obtaining the user's current location.

## Testing

- **Unit Tests**: Includes tests for business logic and data models.
- **Widget Tests**: Ensures the UI displays weather forecasts correctly.

## Notes

- Did include the generated files (e.g. `.g.dart`) for this project, this should be under `.gitignore`.
- Did include the API key on this project for testing purposes it should be under `.env` file and not commited to the repo.

## App Screenshot

![Portrait](images/portrait.png)

![Landscape](images/landscape.png)
