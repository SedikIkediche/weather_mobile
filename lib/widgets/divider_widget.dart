import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Divider(
        height: 2,
        color: Colors.white,
      ),
    );
  }
}