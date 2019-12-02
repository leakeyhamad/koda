import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.params})
      : super(key: key);

  final Map params;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }


  Widget _mainScreen() {
    return Center(child: Text("Welcome.",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30.0),));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.params['appName']),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: () {})
          ],
        ),
        body: _mainScreen()
    );
  }
}