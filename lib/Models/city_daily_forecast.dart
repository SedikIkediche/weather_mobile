class CityDailyForecast {
  final int date;
  final int sunRise;
  final int sunSet;
  final int moonrise;
  final int moonSet;
  final double minTemperature;
  final double maxTemperature;
  final int dayIcon;
  final int nightIcon;

  CityDailyForecast(
      {this.date,
      this.sunRise,
      this.sunSet,
      this.moonrise,
      this.moonSet,
      this.minTemperature,
      this.maxTemperature,
      this.dayIcon,
      this.nightIcon});

  @override
  String toString() {
    return 'cityDailyForecast{date: $date, sunRise: $sunRise, sunSet: $sunSet, moonrise: $moonrise, moonSet: $moonSet, minTemperature: $minTemperature, maxTemperature: $maxTemperature, dayIcon: $dayIcon, nightIcon: $nightIcon}';
  }

  factory CityDailyForecast.fromJson(Map<String, dynamic> json) {
    return CityDailyForecast(
      date: json['EpochDate'],
      sunRise: json['Sun']['EpochRise'],
      sunSet: json['Sun']['EpochSet'],
      moonrise: json['Moon']['EpochRise'],
      moonSet: json['Moon']['EpochSet'],
      minTemperature: json['Temperature']['Minimum']['Value'],
      maxTemperature: json['Temperature']['Maximum']['Value'],
      dayIcon: json['Day']['Icon'],
      nightIcon: json['Night']['Icon'],
    );
  }
}
