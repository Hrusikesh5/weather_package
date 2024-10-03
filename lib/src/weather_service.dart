import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  final String apiKey;

  WeatherService({required this.apiKey});

  // Method to fetch weather data by city name
  Future<WeatherModel> fetchWeather(String cityName) async {
    final queryParameters = {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric', // For temperature in Celsius
    };

    final uri = Uri.http(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // Parse the JSON data
      final jsonData = json.decode(response.body);
      // Create a WeatherModel from JSON data
      return WeatherModel.fromJson(jsonData);
    } else {
      // Handle errors
      throw Exception('Failed to load weather data');
    }
  }
}
