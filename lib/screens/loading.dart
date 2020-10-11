import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final String message;
  Loading({this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitDoubleBounce(
            color: Colors.white,
            size: 50,
          )
        ]);
  }
}
