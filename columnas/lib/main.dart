import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Diseño con columnas',
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
                        child: Text("OPTION A", textAlign: TextAlign.center),
                      ),
                    ]),
                    Column(children: []),
                    Column(children: [
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Text("OPTION A1A", textAlign: TextAlign.center),
                      ),
                    ]),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(children: []),
                    Column(children: [
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Text("OPTION B", textAlign: TextAlign.center),
                      ),
                    ]),
                    Column(children: []),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(children: [
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Text("OPTION C", textAlign: TextAlign.center),
                      ),
                    ]),
                    Column(children: []),
                    Column(children: []),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
