class CityHourlyForecast {
  final int hour;
  final int weatherIcon;
  final double temperature;

  CityHourlyForecast({this.hour, this.weatherIcon, this.temperature});

  @override
  String toString() {
    return 'CityHourlyForecast{hour: $hour, weatherIcon: $weatherIcon, temperature: $temperature}';
  }

  factory CityHourlyForecast.fromJson(Map<String, dynamic> json) {
    return CityHourlyForecast(
      hour: json['EpochDateTime'],
      weatherIcon: json['WeatherIcon'],
      temperature: json['Temperature']['Value'],
    );
  }
}
