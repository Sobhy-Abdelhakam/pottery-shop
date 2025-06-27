export 'package:pottery/congifures/light_theme.dart';
export 'package:pottery/congifures/dark_theme.dart';

import 'package:flutter/material.dart';

extension AppTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}