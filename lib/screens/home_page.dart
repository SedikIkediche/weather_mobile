import 'package:flutter/material.dart';
import 'package:weather_mobile/Models/city.dart';
import 'package:weather_mobile/blocs/shared_bloc.dart';
import 'package:weather_mobile/utils/response.dart';
import 'package:weather_mobile/utils/status.dart';
import 'file:///C:/Users/ikedi/Desktop/KotlinProjects/weather_mobile/lib/screens/loading.dart';
import 'file:///C:/Users/ikedi/Desktop/KotlinProjects/weather_mobile/lib/screens/error.dart';
import 'file:///C:/Users/ikedi/Desktop/KotlinProjects/weather_mobile/lib/screens/weather_page.dart';

class HomePage extends StatefulWidget {
  static final id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedBloc _sharedBloc;

  @override
  void dispose() {
    super.dispose();
    _sharedBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    _sharedBloc = SharedBloc();
  }

  Widget body(AsyncSnapshot<Response<City>> snapshot) {
    if (snapshot.hasData) {
      switch (snapshot.data.status) {
        case Status.LOCATIONSERVICELOADING:
          return Loading(
            message: snapshot.data.message,
          );
          break;
        case Status.NETWORKLOADING:
          return Loading(
            message: snapshot.data.message,
          );
          break;
        case Status.LOCATIONSERVICEERROR:
          return Error(
            message: snapshot.data.message,
            imagePath: 'assets/svgs/location.svg',
            onPressed: () {
              _sharedBloc.fetchData();
            },
          );
          break;
        case Status.PERMISSIONERROR:
          return Error(
            message: snapshot.data.message,
            imagePath: 'assets/svgs/permission.svg',
            onPressed: () {
              _sharedBloc.fetchData();
            },
          );
          break;
        case Status.LOCATIONERROR:
          return Error(
            message: snapshot.data.message,
            imagePath: 'assets/svgs/location_error.svg',
            onPressed: () {
              _sharedBloc.fetchData();
            },
          );
          break;
        case Status.NETWORKERROR:
          return Error(
            message: snapshot.data.message,
            imagePath: 'assets/svgs/error.svg',
            onPressed: () {
              _sharedBloc.fetchData();
            },
          );
          break;
        case Status.COMPLETED:
          return WeatherPage(
            city: snapshot.data.data,
          );
          break;
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Response<City>>(
      stream: _sharedBloc.sharedStream,
      builder: (context, snapshot) {
        return SafeArea(
          child: Scaffold(
            body: body(snapshot),
          ),
        );
      },
    );
  }
}
