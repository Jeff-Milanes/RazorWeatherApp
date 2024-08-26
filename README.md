# RazorERP Weather App

## Overview

The RazorERP Weather App provides a 5-day weather forecast based on the user's current location. It uses the OpenWeatherMap API to fetch weather data and displays it in a user-friendly format. The app is designed to be responsive, supporting both horizontal and vertical orientations.

## Key Technologies and Plugins

- **Dio**: For making API calls with an API key as an interceptor.
- **Bloc**: For state management.
- **Built Value**: For JSON deserialization.
- **Hydrated Bloc**: For persisting and retrieving the last state, allowing offline access.
- **Geolocator**: For obtaining the user's current location.

## Features

- Fetches and displays weather forecasts for the next 5 days based on the user's current location.
- Uses state management with `bloc` and `hydrated_bloc` to manage and persist state.
- Implements data deserialization with `built_value`.
- Handles API requests with `dio`.

## Testing

- **Unit Tests**: Includes tests for business logic and data models.
- **Widget Tests**: Ensures the UI displays weather forecasts correctly.

## App Screenshot

![App Screenshot](path/to/screenshot.png)
