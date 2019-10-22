import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Center(
        child: Icon(
          Icons.location_on,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
