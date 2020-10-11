import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_mobile/Models/city_daily_forecast.dart';
import 'package:weather_mobile/Models/city_information.dart';
import 'package:weather_mobile/utils/utils.dart';

class DailyForecastItemWidget extends StatelessWidget {
  final CityDailyForecast cityDailyForecast;
  final CityInformation cityInformation;

  DailyForecastItemWidget({this.cityDailyForecast, this.cityInformation});

  _launchURL() async {
    int dayNumber;

    if (getDayNumber(cityDailyForecast.date) == 7) {
      dayNumber = 1;
    } else {
      dayNumber = getDayNumber(cityDailyForecast.date) + 1;
    }

    String url =
        'https://www.accuweather.com/en/${cityInformation.countryId}/${cityInformation.cityName}/${cityInformation.cityLocationKey}/daily-weather-forecast/${cityInformation.cityLocationKey}?day=$dayNumber';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        height: 55,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                formatDate(cityDailyForecast.date),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                weatherIconMapper(cityDailyForecast.dayIcon),
                height: 30,
                width: 30,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${cityDailyForecast.maxTemperature.toStringAsFixed(0)}° / ${cityDailyForecast.minTemperature.toStringAsFixed(0)}°',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
