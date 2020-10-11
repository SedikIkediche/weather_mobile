import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_mobile/Models/city_current_condition.dart';
import 'package:weather_mobile/Models/city_information.dart';

class ComfortLevelWidget extends StatelessWidget {
  final CityCurrentCondition cityCurrentCondition;
  final CityInformation cityInformation;

  ComfortLevelWidget({this.cityCurrentCondition, this.cityInformation});

  _launchURL() async {
    String url =
        'https://www.accuweather.com/en/${cityInformation.countryId}/${cityInformation.cityName}/${cityInformation.cityLocationKey}/air-travel-weather/${cityInformation.cityLocationKey}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
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
                    'COMFORT LEVEL',
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
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Humidity',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                positionFactor: 0.01,
                                angle: 90,
                                widget: Text(
                                  cityCurrentCondition.relativeHumidity
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ))
                          ],
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: cityCurrentCondition.relativeHumidity
                                    .toDouble(),
                                cornerStyle: CornerStyle.bothCurve,
                                width: 0.12,
                                color: Colors.white,
                                sizeUnit: GaugeSizeUnit.factor)
                          ],
                          minimum: 0,
                          maximum: 100,
                          interval: 100,
                          showLabels: true,
                          showTicks: false,
                          axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                          ),
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.12,
                            cornerStyle: CornerStyle.bothCurve,
                            color: Color(0x80bdbdbd),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Feels like     ${cityCurrentCondition.realFeelTemperature.toStringAsFixed(0)}°',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'UV index     ${cityCurrentCondition.uvIndex} ${cityCurrentCondition.uvIndexText}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
