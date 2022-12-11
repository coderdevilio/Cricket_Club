import 'package:flutter/material.dart';

class OurTheme {
  Color _lightBlack = Color.fromARGB(255, 100, 100, 100);
  Color _lightGrey = Color.fromARGB(255, 0, 122, 155);
  Color _darkerGrey = Color.fromARGB(255, 119, 124, 135);

  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _lightBlack,
        primaryColor: _lightBlack,
        accentColor: _lightGrey,
        secondaryHeaderColor: _darkerGrey,
        hintColor: _lightBlack,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _lightGrey,
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: _darkerGrey,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            minWidth: 150,
            height: 40.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))));
  }
}
