import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_mobile/Models/city_information.dart';

class ExtendedForecast extends StatelessWidget {
  final CityInformation cityInformation;

  ExtendedForecast({this.cityInformation});

  _launchURL() async {
    String url =
        'https://www.accuweather.com/en/${cityInformation.countryId}/${cityInformation.cityName}/${cityInformation.cityLocationKey}/daily-weather-forecast/${cityInformation.cityLocationKey}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Container(
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'EXTENDED FORECAST',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Icon(
              CupertinoIcons.forward,
              color: Colors.white,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
