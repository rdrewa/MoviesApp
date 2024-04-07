import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_scheme.dart';

final TextTheme fontTextTheme = GoogleFonts.latoTextTheme();

class AppTheme {
  AppTheme._();

  static ThemeData lightMode = ThemeData.light(useMaterial3: true).copyWith(
      brightness: Brightness.light,
      colorScheme: AppColorScheme.lightScheme,
      scaffoldBackgroundColor: AppColorScheme.lightScheme.background,
      textTheme: fontTextTheme
          .apply(
              bodyColor: AppColorScheme.lightScheme.onBackground,
              displayColor: AppColorScheme.lightScheme.primary)
          .copyWith(
              labelMedium: fontTextTheme.labelMedium
                  ?.copyWith(color: AppColorScheme.lightScheme.tertiary)));

  static ThemeData darkMode = ThemeData.dark(useMaterial3: true).copyWith(
      brightness: Brightness.dark,
      colorScheme: AppColorScheme.darkScheme,
      scaffoldBackgroundColor: AppColorScheme.darkScheme.background,
      textTheme: fontTextTheme
          .apply(
              bodyColor: AppColorScheme.darkScheme.onBackground,
              displayColor: AppColorScheme.darkScheme.primary)
          .copyWith(
              labelMedium: fontTextTheme.labelMedium
                  ?.copyWith(color: AppColorScheme.darkScheme.tertiary)));
}
