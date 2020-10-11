import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_mobile/Models/city_current_condition.dart';
import 'package:weather_mobile/Models/city_information.dart';

class WindWidget extends StatefulWidget {
  final CityCurrentCondition cityCurrentCondition;
  final CityInformation cityInformation;

  WindWidget({this.cityCurrentCondition, this.cityInformation});

  @override
  _WindWidgetState createState() => _WindWidgetState();
}

class _WindWidgetState extends State<WindWidget> {
  _launchURL() async {
    String url =
        'https://www.accuweather.com/en/${widget.cityInformation.countryId}/${widget.cityInformation.cityName}/${widget.cityInformation.cityLocationKey}/current-weather/${widget.cityInformation.cityLocationKey}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: _launchURL,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 16,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'WIND',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'MORE',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.forward,
                        size: 22,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 136,
                    width: 130,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 136,
                            width: 100,
                            child: FlareActor(
                              'assets/flare/wind.flr',
                              fit: BoxFit.fitWidth,
                              animation: 'rotate',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 82,
                            width: 60,
                            child: FlareActor(
                              'assets/flare/wind.flr',
                              fit: BoxFit.fitWidth,
                              animation: 'rotate',
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Direction      ${widget.cityCurrentCondition.windDirection}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Speed           ${widget.cityCurrentCondition.windSpeed.toStringAsFixed(0)} km/h',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
