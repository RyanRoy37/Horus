import 'package:flutter/material.dart';
import 'widgets/main_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(BirdIdentifierApp());
}

class BirdIdentifierApp extends StatelessWidget {
  const BirdIdentifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bird Identifier',
      theme: AppTheme.lightTheme,
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
