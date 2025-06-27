import 'package:flutter/material.dart';

// Dark Theme
final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.deepPurpleAccent),
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: const Color(0xFF1F1F1F),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: _darkTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blueAccent,
      side: const BorderSide(color: Colors.blueAccent),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.blueAccent),
    ),
    labelStyle: const TextStyle(color: Colors.grey),
  ),
);

// Dark Text Theme
const _darkTextTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
  displayMedium: TextStyle(
      fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
  displaySmall: TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
  headlineMedium: TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  headlineSmall: TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  titleLarge: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
  bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white70),
  bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white60),
  bodySmall: TextStyle(fontSize: 12.0, color: Colors.white38),
);