import 'package:flutter/cupertino.dart';
import 'package:weather_mobile/Models/city_hourly_forecast.dart';
import 'package:weather_mobile/Models/city_information.dart';
import 'package:weather_mobile/widgets/hourly_forecast_item_widget.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List<CityHourlyForecast> hourlyForecast;
  final CityInformation cityInformation;

  HourlyForecastWidget({this.hourlyForecast, this.cityInformation});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 112,
        margin: EdgeInsets.only(
          top: 12,
          bottom: 12,
        ),
        child: ListView.builder(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: hourlyForecast.length,
            itemBuilder: (context, index) {
              return HourlyForecastItemWidget(
                cityHourlyForecast: hourlyForecast[index],
                cityInformation: cityInformation,
              );
            }));
  }
}
