import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Diseño',
        theme: ThemeData(
            primarySwatch: Colors.green, primaryColorDark: Colors.deepOrange),
        home: Scaffold(
          appBar: AppBar(title: Text('Titulo de App'), centerTitle: true),
          body: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(children: [
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Text("OPTION 1", textAlign: TextAlign.center),
                      ),
                    ]),
                    Column(children: [
                      RaisedButton(
                        color: Colors.blue,
                        onPressed: () {},
                        child: Text("OPTION 3", textAlign: TextAlign.center),
                      ),
                    ]),
                    Column(children: [
                      RaisedButton(
                        color: Colors.red,
                        onPressed: () {},
                        child: Text("OPTION 2", textAlign: TextAlign.center),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
