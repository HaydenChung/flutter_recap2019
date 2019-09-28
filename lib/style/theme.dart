import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

ThemeData primaryTheme() {
  return new ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    accentColor: Colors.yellowAccent,
    buttonColor: Colors.amberAccent,
    textTheme: TextTheme(
        button: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)
    ),
  );
}
