import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Color(0xFF2E7D32),
      hintColor: Color(0xFF66BB6A),
      fontFamily: 'Roboto',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}