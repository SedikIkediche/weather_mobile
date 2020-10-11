import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Error extends StatelessWidget {
  final String message;
  final String imagePath;
  final Function onPressed;

  Error({this.message, this.imagePath, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              imagePath,
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            OutlineButton(
              onPressed: this.onPressed,
              textColor: Colors.white,
              child: Text('Try again'),
              borderSide: BorderSide(color: Colors.white),
              highlightedBorderColor: Colors.white,
            ),
          ]),
    );
  }
}