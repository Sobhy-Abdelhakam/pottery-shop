import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/congifures/light_theme.dart';
import 'package:pottery/congifures/dark_theme.dart';
import 'package:pottery/feature/landing/views/landing_pages_view.dart';
import 'package:pottery/feature/landing/bloc/landing_cubit.dart';

void main() {
  runApp(
    BlocProvider<LandingCubit>(
      create: (context) => LandingCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Landing Pages',
      theme: lightTheme, // Light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: ThemeMode.light,
      home: const LandingPagesView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
