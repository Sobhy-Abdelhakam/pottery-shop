import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/congifures/light_theme.dart';
import 'package:pottery/congifures/dark_theme.dart';
import 'package:pottery/feature/cart/bloc/cart_bloc.dart';
import 'package:pottery/feature/landing/views/landing_pages_view.dart';
import 'package:pottery/feature/landing/bloc/landing_cubit.dart';
import 'package:pottery/feature/main_navigation/view/main_navigation_view.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => LandingCubit()),
      BlocProvider(create: (context) => CartBloc()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme, // Light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: ThemeMode.light,
      home: const MainNavigationView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
