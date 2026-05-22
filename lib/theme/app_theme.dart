import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 24,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF3B82F6),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF111827),
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 24,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF3B82F6),
    ),
  );
}
