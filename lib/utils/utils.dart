import 'package:weather_mobile/Models/city_daily_forecast.dart';
import 'package:weather_mobile/Models/city_hourly_forecast.dart';
import 'package:intl/intl.dart';

List<CityDailyForecast> daysList(Map<String, dynamic> json) {
  List<CityDailyForecast> daysList = [];
  (json['DailyForecasts'] as List).forEach((element) {
    daysList.add(CityDailyForecast.fromJson(element));
  });
  return daysList;
}

List<CityHourlyForecast> hoursList(List<dynamic> json) {
  List<CityHourlyForecast> hoursList = [];
  json.forEach((element) {
    hoursList.add(CityHourlyForecast.fromJson(element));
  });
  return hoursList;
}

String weatherIconMapper(int weatherIcon) {
  String imagePath;
  String basePath = 'assets/svgs/';
  if (weatherIcon == 1) {
    imagePath = '${basePath}sun.svg';
  } else if (weatherIcon >= 2 && weatherIcon <= 6) {
    imagePath = '${basePath}sun_and_cloud.svg';
  } else if (weatherIcon == 7 || weatherIcon == 8 || weatherIcon == 11) {
    imagePath = '${basePath}cloud.svg';
  } else if (weatherIcon == 12 ||
      weatherIcon == 13 ||
      weatherIcon == 14 ||
      weatherIcon == 39 ||
      weatherIcon == 40) {
    imagePath = '${basePath}showering.svg';
  } else if (weatherIcon == 15 ||
      weatherIcon == 16 ||
      weatherIcon == 17 ||
      weatherIcon == 41 ||
      weatherIcon == 42) {
    imagePath = '${basePath}thunder.svg';
  } else if (weatherIcon == 18 ||
      weatherIcon == 19 ||
      weatherIcon == 20 ||
      weatherIcon == 21 ||
      weatherIcon == 43 ||
      weatherIcon == 25 ||
      weatherIcon == 26 ||
      weatherIcon == 29) {
    imagePath = '${basePath}raining.svg';
  } else if (weatherIcon == 15 ||
      weatherIcon == 22 ||
      weatherIcon == 23 ||
      weatherIcon == 44) {
    imagePath = '${basePath}snowing.svg';
  } else if (weatherIcon == 32) {
    imagePath = '${basePath}wind.svg';
  } else if (weatherIcon == 33) {
    imagePath = '${basePath}moon.svg';
  } else if (weatherIcon >= 34 && weatherIcon <= 38) {
    imagePath = '${basePath}moon_and_cloud.svg';
  }
  return imagePath;
}

String formatDate(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  DateFormat formatter = DateFormat('E, d MMM');
  return formatter.format(dateTime);
}

String formatTime(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  DateFormat formatter = DateFormat('hh:mm');
  return formatter.format(dateTime);
}

int getDayNumber(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  return dateTime.weekday;
}
