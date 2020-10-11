import 'package:location/location.dart';
import 'package:weather_mobile/Models/city_information.dart';
import 'package:weather_mobile/Models/city_current_condition.dart';
import 'package:weather_mobile/Models/city_daily_forecast.dart';
import 'package:weather_mobile/Models/city_hourly_forecast.dart';
import 'package:weather_mobile/services/network_service.dart';
import 'package:weather_mobile/utils/utils.dart';

class WeatherRepository {
  NetworkService _networkService = NetworkService();

  Future<CityInformation> fetchLocationKey(LocationData locationData) async {
    final response = await _networkService.getLocationKEy(locationData);
    return CityInformation.fromJson(response);
  }

  Future<CityCurrentCondition> fetchCurrentCondition(String locationKey) async {
    final response =
        await _networkService.getCurrentWeatherCondition(locationKey);
    return CityCurrentCondition.fromJson(response);
  }

  Future<List<CityDailyForecast>> fetchDailyForecast(String locationKey) async {
    final response = await _networkService.getDailyForecast(locationKey);
    return daysList(response);
  }

  Future<List<CityHourlyForecast>> fetchHourlyForecast(
      String locationKey) async {
    final response = await _networkService.getHourlyForecast(locationKey);
    return hoursList(response);
  }
}
