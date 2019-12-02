import 'package:flutter/material.dart';
import 'package:flutter_login/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // login page parameters:
  // primary swatch color
  static const primarySwatch = Colors.deepOrange;
  // button color
  static const buttonColor = Colors.deepOrange;
  // app name
  static const appName = 'Simple Login UI';
  // boolean for showing home page if user unverified
  static const homePageUnverified = false;

  final params = {
    'appName': appName,
    'primarySwatch': primarySwatch,
    'buttonColor': buttonColor,
    'homePageUnverified': homePageUnverified,
  };


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: params['primarySwatch'],
        ),
        home: new RootPage(params: params));
  }
}