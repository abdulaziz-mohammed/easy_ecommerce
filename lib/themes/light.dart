import 'package:flutter/material.dart';

var lightTheme = (BuildContext context) => Theme.of(context).copyWith(
      primaryColor: Color(0xFF2aa377),
      accentColor: Colors.white,
      backgroundColor: Colors.grey[200],
      buttonTheme: ButtonTheme.of(context).copyWith(
        buttonColor: Color(0xFF2aa377),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey[200],
      ),
    );
