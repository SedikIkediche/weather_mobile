import 'package:weather_mobile/Models/city_current_condition.dart';
import 'package:weather_mobile/Models/city_daily_forecast.dart';
import 'package:weather_mobile/Models/city_hourly_forecast.dart';
import 'package:weather_mobile/Models/city_information.dart';

class City {
  final CityInformation cityInformation;
  final CityCurrentCondition cityCurrentCondition;
  final List<CityHourlyForecast> cityHourlyForecastList;
  final List<CityDailyForecast> cityDailyForecastList;

  City(
      {this.cityInformation,
      this.cityCurrentCondition,
      this.cityHourlyForecastList,
      this.cityDailyForecastList});
}
