import 'package:flutter/material.dart';

// Light Theme
final lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.deepPurpleAccent),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black, // Text & icons
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: _lightTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blue,
      side: const BorderSide(color: Colors.blue),
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
      borderSide: const BorderSide(color: Colors.blue),
    ),
    labelStyle: const TextStyle(color: Colors.grey),
  ),
);

// Light Text Theme
const _lightTextTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
  displayMedium: TextStyle(
      fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
  displaySmall: TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
  headlineMedium: TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
  headlineSmall: TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
  titleLarge: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
  bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
  bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
  bodySmall: TextStyle(fontSize: 12.0, color: Colors.black38),
);