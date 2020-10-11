import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_mobile/Models/city_current_condition.dart';
import 'package:weather_mobile/Models/city_daily_forecast.dart';
import 'package:weather_mobile/Models/city_information.dart';
import 'package:weather_mobile/provider_models/scroll_position_model.dart';
import 'package:weather_mobile/utils/utils.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CityCurrentCondition cityCurrentCondition;
  final CityDailyForecast cityDailyForecast;
  final CityInformation cityInformation;

  CurrentWeatherWidget(
      {this.cityCurrentCondition,
      this.cityDailyForecast,
      this.cityInformation});

  _launchURL() async {
    String url =
        'https://www.accuweather.com/en/${cityInformation.countryId}/${cityInformation.cityName}/${cityInformation.cityLocationKey}/current-weather/${cityInformation.cityLocationKey}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Consumer<ScrollPositionModel>(
        builder: (context, scrollPositionModel, child) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: scrollPositionModel.getScrollPosition ?? 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  weatherIconMapper(cityCurrentCondition.weatherIcon),
                  height: 80,
                  width: 112,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  cityCurrentCondition.temperature.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 5,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${cityDailyForecast.maxTemperature.toStringAsFixed(0)}°/${cityDailyForecast.minTemperature.toStringAsFixed(0)}°',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 4,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
