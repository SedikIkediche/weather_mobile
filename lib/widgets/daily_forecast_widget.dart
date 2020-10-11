import 'package:flutter/material.dart';
import 'package:weather_mobile/Models/city_daily_forecast.dart';
import 'package:weather_mobile/Models/city_information.dart';
import 'package:weather_mobile/widgets/daily_forecast_item_widget.dart';

class DailyForecastWidget extends StatelessWidget {
  final List<CityDailyForecast> dailyForecast;
  final CityInformation cityInformation;

  DailyForecastWidget({this.dailyForecast, this.cityInformation});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: dailyForecast.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container();
        } else {
          return DailyForecastItemWidget(
            cityDailyForecast: dailyForecast[index],
            cityInformation: cityInformation,
          );
        }
      },
    );
  }
}
