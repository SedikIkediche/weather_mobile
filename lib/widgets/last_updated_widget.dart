import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_mobile/Models/city_current_condition.dart';
import 'package:weather_mobile/utils/utils.dart';

class LastUpdatedWidget extends StatelessWidget {
  final CityCurrentCondition cityCurrentCondition;

  LastUpdatedWidget({this.cityCurrentCondition});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 22,
        right: 22,
      ),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/svgs/sun.svg',
                  height: 16,
                  width: 16,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'AccuWeather',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Text(
              'Last updated: ${formatTime(cityCurrentCondition.lastUpdated)}',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ]),
    );
  }
}
