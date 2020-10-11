import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile/Models/city.dart';
import 'package:weather_mobile/provider_models/scroll_position_model.dart';
import 'package:weather_mobile/widgets/comfort_level_widget.dart';
import 'package:weather_mobile/widgets/current_weather_widget.dart';
import 'package:weather_mobile/widgets/daily_forecast_widget.dart';
import 'package:weather_mobile/widgets/divider_widget.dart';
import 'package:weather_mobile/widgets/extended_forecast.dart';
import 'package:weather_mobile/widgets/hourly_forecast_widget.dart';
import 'package:weather_mobile/widgets/last_updated_widget.dart';
import 'package:weather_mobile/widgets/wind_widget.dart';

class WeatherPage extends StatefulWidget {
  final City city;

  WeatherPage({this.city});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  ScrollController _controller = ScrollController();
  List<Widget> widgetsList;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.offset >= 0.0) {
        Provider.of<ScrollPositionModel>(context, listen: false)
            .setScrollPosition(_controller.offset);
        print(_controller.offset);
      } else {
        Provider.of<ScrollPositionModel>(context, listen: false)
            .setScrollPosition(0.0);
      }
    });
    widgetsList = [
      CurrentWeatherWidget(
        cityCurrentCondition: widget.city.cityCurrentCondition,
        cityDailyForecast: widget.city.cityDailyForecastList[0],
        cityInformation: widget.city.cityInformation,
      ),
      LastUpdatedWidget(
        cityCurrentCondition: widget.city.cityCurrentCondition,
      ),
      DividerWidget(),
      HourlyForecastWidget(
        hourlyForecast: widget.city.cityHourlyForecastList,
        cityInformation: widget.city.cityInformation,
      ),
      DividerWidget(),
      DailyForecastWidget(
        dailyForecast: widget.city.cityDailyForecastList,
        cityInformation: widget.city.cityInformation,
      ),
      ExtendedForecast(
        cityInformation: widget.city.cityInformation,
      ),
      DividerWidget(),
      ComfortLevelWidget(
        cityCurrentCondition: widget.city.cityCurrentCondition,
        cityInformation: widget.city.cityInformation,
      ),
      DividerWidget(),
      WindWidget(
        cityCurrentCondition: widget.city.cityCurrentCondition,
        cityInformation: widget.city.cityInformation,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 100,
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.only(bottom: 10),
            title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.city.cityInformation.cityName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    CupertinoIcons.location_solid,
                    color: Colors.white,
                    size: 20,
                  )
                ]),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return widgetsList[index];
            },
            childCount: widgetsList.length,
          ),
        ),
      ],
    );
  }
}

//shrinkWrap: true,
//physics: ClampingScrollPhysics(),
