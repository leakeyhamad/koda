import 'package:flutter/material.dart';
import 'package:flutter_login/pages/login_signup_page.dart';
import 'package:flutter_login/pages/home_page.dart';

class RootPage extends StatefulWidget {
  RootPage({this.params});

  final Map params;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {

  Widget _waitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO show login or home page depending on user login state
    const bool showLogin = true;

    switch (showLogin) {
      case true:
        return new LoginSignUpPage(
          params: widget.params,
        );
        break;
      case false:
        return new HomePage(
          params: widget.params,
        );
        break;
      default:
        return _waitingScreen();
    }
  }
}