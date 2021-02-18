import 'package:flutter/material.dart';

var darkTheme = (BuildContext context) => Theme.of(context).copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFF212121),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
        ),
      ),
      // primaryColor: Color(0xFF2aa377),
      // accentColor: Colors.white,
      // buttonTheme: ButtonTheme.of(context).copyWith(
      //   buttonColor: Color(0xFF2aa377),
      //   textTheme: ButtonTextTheme.primary,
      // ),
    );
