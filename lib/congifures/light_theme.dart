import 'package:flutter/material.dart';
import 'package:pottery/congifures/app_color.dart';

// Light Theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: createMaterialColor(AppColor.primaryColor),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: _lightTextTheme,
  filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColor.primaryColor),
      padding: const EdgeInsets.all(16),
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

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.toARGB32(), swatch);
}
