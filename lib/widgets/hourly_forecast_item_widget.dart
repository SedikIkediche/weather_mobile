import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_mobile/Models/city_hourly_forecast.dart';
import 'package:weather_mobile/Models/city_information.dart';
import 'package:weather_mobile/utils/utils.dart';

class HourlyForecastItemWidget extends StatelessWidget {
  final CityHourlyForecast cityHourlyForecast;
  final CityInformation cityInformation;

  HourlyForecastItemWidget({this.cityHourlyForecast, this.cityInformation});

  _launchURL() async {
    String url =
        'https://www.accuweather.com/en/${cityInformation.countryId}/${cityInformation.cityName}/${cityInformation.cityLocationKey}/hourly-weather-forecast/${cityInformation.cityLocationKey}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
          left: 12,
          right: 12,
          bottom: 4,
        ),
        child: Column(
          children: <Widget>[
            Text(
              formatTime(cityHourlyForecast.hour),
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            SvgPicture.asset(
              weatherIconMapper(cityHourlyForecast.weatherIcon),
              width: 30,
              height: 30,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              '${cityHourlyForecast.temperature.toStringAsFixed(0)}°',
              style: TextStyle(fontSize: 16, letterSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}
