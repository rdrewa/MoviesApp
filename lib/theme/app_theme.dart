import 'package:flutter/material.dart';

import 'app_tab_bar_theme.dart';
import 'app_app_bar_theme.dart';
import 'app_bottom_bar_theme.dart';
import 'app_text_theme.dart';
import 'app_color_scheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightMode = ThemeData.light(useMaterial3: true).copyWith(
      brightness: Brightness.light,
      colorScheme: AppColorScheme.lightScheme,
      scaffoldBackgroundColor: AppColorScheme.lightScheme.background,
      textTheme: AppTextTheme.lightTheme,
      appBarTheme: AppAppBarTheme.lightTheme,
      tabBarTheme: AppTabBarTheme.lightTheme,
      bottomNavigationBarTheme: AppBottomBapTheme.lightTheme);

  static ThemeData darkMode = ThemeData.dark(useMaterial3: true).copyWith(
      brightness: Brightness.dark,
      colorScheme: AppColorScheme.darkScheme,
      scaffoldBackgroundColor: AppColorScheme.darkScheme.background,
      textTheme: AppTextTheme.darkTheme,
      appBarTheme: AppAppBarTheme.darkTheme,
      tabBarTheme: AppTabBarTheme.darkTheme,
      bottomNavigationBarTheme: AppBottomBapTheme.darkTheme);
}
