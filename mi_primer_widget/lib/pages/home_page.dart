import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Titulo de App'), centerTitle: true),
        body: Center(child: Text('Curso Sipecom mi primer widget')));
  }
}
