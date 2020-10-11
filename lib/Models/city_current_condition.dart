class CityCurrentCondition {
  final int weatherIcon;
  final int lastUpdated;
  final double temperature;
  final double realFeelTemperature;
  final int relativeHumidity;
  final String windDirection;
  final double windSpeed;
  final int uvIndex;
  final String uvIndexText;

  CityCurrentCondition(
      {this.weatherIcon,
      this.lastUpdated,
      this.temperature,
      this.realFeelTemperature,
      this.relativeHumidity,
      this.windDirection,
      this.windSpeed,
      this.uvIndex,
      this.uvIndexText});

  @override
  String toString() {
    return 'CityCurrentCondition{weatherIcon: $weatherIcon, lastUpdated: $lastUpdated, temperature: $temperature, realFeelTemperature: $realFeelTemperature, relativeHumidity: $relativeHumidity, windDirection: $windDirection, windSpeed: $windSpeed, uvIndex: $uvIndex, uvIndexText: $uvIndexText}';
  }

  factory CityCurrentCondition.fromJson(Map<String, dynamic> json) {
    return CityCurrentCondition(
      weatherIcon: json['WeatherIcon'],
      lastUpdated: json['EpochTime'],
      temperature: json['Temperature']['Metric']['Value'],
      realFeelTemperature: json['RealFeelTemperature']['Metric']['Value'],
      relativeHumidity: json['RelativeHumidity'],
      windDirection: json['Wind']['Direction']['English'],
      windSpeed: json['Wind']['Speed']['Metric']['Value'],
      uvIndex: json['UVIndex'],
      uvIndexText: json['UVIndexText'],
    );
  }
}
