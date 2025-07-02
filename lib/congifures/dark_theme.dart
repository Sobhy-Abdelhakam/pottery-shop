import 'package:flutter/material.dart';
import 'package:pottery/congifures/app_color.dart';
import 'package:pottery/congifures/light_theme.dart';

// Dark Theme
final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: createMaterialColor(AppColor.primaryColor),
    brightness: Brightness.dark,
  ),
  textTheme: _darkTextTheme,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
    // foregroundColor: Colors.white,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColor.primaryColor),
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
      borderSide: const BorderSide(color: AppColor.primaryColor),
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
