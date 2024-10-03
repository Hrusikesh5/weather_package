class WeatherModel {
  final String cityName;
  final double temperature;
  final int humidity;
  final String description;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.description,
  });

  // Factory method to create a WeatherModel from JSON data
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature:
          (json['main']['temp'] as num).toDouble(), // Convert to double
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
    );
  }
}
