import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import 'package:weather_mobile/utils/custom_exception.dart';

class NetworkService {
  final String _geolocationBaseUrl =
      "https://dataservice.accuweather.com/locations/v1/cities/geoposition/search";
  final String _currentConditionBaseUrl =
      'http://dataservice.accuweather.com/currentconditions/v1/';
  final String _dailyForecastBaseUrl =
      'http://dataservice.accuweather.com/forecasts/v1/daily/5day/';
  final String _hourlyForecastBaseUrl =
      'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/';
  // final String _apiKey = 'JGHGL5GHXGrIdxgi3mNVGYX6HhuCt3W7';
  final String _apiKey = 'R9ABLtWYqKDhl8FtUy4r8IRTqtMlj4Am';
  Future<dynamic> getLocationKEy(LocationData locationData) async {
    var responseJson;
    try {
      final response = await http.get(
          '$_geolocationBaseUrl?q=${locationData.latitude},${locationData.longitude}&language=en-us&details=false&toplevel=true&apikey=$_apiKey');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getCurrentWeatherCondition(String cityLocationKey) async {
    var responseJson;
    try {
      final response = await http.get(
          '$_currentConditionBaseUrl$cityLocationKey?language=en-us&details=true&apikey=$_apiKey');
      responseJson = _response(response)[0];
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getDailyForecast(String cityLocationKey) async {
    var responseJson;
    try {
      final response = await http.get(
          '$_dailyForecastBaseUrl$cityLocationKey?language=en-us&details=true&metric=true&apikey=$_apiKey');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getHourlyForecast(String cityLocationKey) async {
    var responseJson;
    try {
      final response = await http.get(
          '$_hourlyForecastBaseUrl$cityLocationKey?language=en-us&details=true&metric=true&apikey=$_apiKey');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
