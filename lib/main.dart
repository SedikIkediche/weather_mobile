import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_mobile/provider_models/scroll_position_model.dart';
import 'package:weather_mobile/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFF559BCF),
        systemNavigationBarColor: Color(0xFF559BCF)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'googleSansRegular',
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: Color(0xFF559BCF),
        appBarTheme: AppBarTheme(
          color: Color(0xFF559BCF),
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (context) => ScrollPositionModel(), child: HomePage()),
    );
  }
}
