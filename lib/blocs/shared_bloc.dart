import 'dart:async';
import 'package:location/location.dart';
import 'package:weather_mobile/Models/city.dart';
import 'package:weather_mobile/Models/city_information.dart';
import 'package:weather_mobile/Models/city_current_condition.dart';
import 'package:weather_mobile/Models/city_daily_forecast.dart';
import 'package:weather_mobile/Models/city_hourly_forecast.dart';
import 'package:weather_mobile/repositories/weather_repository.dart';
import 'package:weather_mobile/services/location_service.dart';
import 'package:weather_mobile/utils/response.dart';

class SharedBloc {
  StreamController _sharedController;
  LocationService _locationService;
  WeatherRepository _weatherRepository;

  StreamSink<Response<City>> get _sharedSink => _sharedController.sink;

  Stream<Response<City>> get sharedStream => _sharedController.stream;

  SharedBloc() {
    _sharedController = StreamController<Response<City>>();
    _weatherRepository = WeatherRepository();
    _locationService = LocationService();
    fetchData();
  }

  void fetchData() async {
    _sharedSink.add(Response.locationServiceLoading('Getting location'));

    bool isLocationEnabled = await _locationService.requestLocationService();

    if (isLocationEnabled) {
      bool isPermissionGranted = await _locationService.requestPermission();

      if (isPermissionGranted) {
        LocationData locationData = await _locationService.requestLocation();
        if (locationData != null) {
          _sharedSink.add(Response.netWorkLoading('Getting weather data'));
          try {
            CityInformation cityInformation =
                await _weatherRepository.fetchLocationKey(locationData);

            CityCurrentCondition cityCurrentCondition = await _weatherRepository
                .fetchCurrentCondition(cityInformation.cityLocationKey);

            List<CityDailyForecast> daysList = await _weatherRepository
                .fetchDailyForecast(cityInformation.cityLocationKey);

            List<CityHourlyForecast> hoursList = await _weatherRepository
                .fetchHourlyForecast(cityInformation.cityLocationKey);

            City city = City(
                cityInformation: cityInformation,
                cityCurrentCondition: cityCurrentCondition,
                cityHourlyForecastList: hoursList,
                cityDailyForecastList: daysList);
            _sharedSink.add(Response.completed(city));
          } catch (e) {
            _sharedSink.add(Response.netWorkError(e.toString()));
          }
        } else {
          _sharedSink
              .add(Response.locationError('Unable to get your location'));
        }
      } else {
        _sharedSink
            .add(Response.permissionError('Accept permission to continue'));
      }
    } else {
      _sharedSink
          .add(Response.locationServiceError('Enable location to continue'));
    }
  }

  dispose() {
    _sharedController?.close();
  }
}
