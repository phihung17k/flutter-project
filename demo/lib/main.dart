import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Navigator _getNavigator(BuildContext context) {
    return new Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return new MaterialPageRoute(builder: (context) {
          return new Center(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(settings.name),
                new TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "${settings.name}/next"),
                  child: new Text('Next'),
                ),
                new TextButton(
                  onPressed: () =>
                      Navigator.pop(context),
                  child: new Text('Back'),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: _getNavigator(context),
          ),
          new Expanded(
            child: _getNavigator(context),
          ),
          new Expanded(
            child: _getNavigator(context),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}