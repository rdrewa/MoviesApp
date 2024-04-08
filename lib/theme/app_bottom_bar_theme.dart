import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppBottomBapTheme {
  AppBottomBapTheme._();

  static _prepareTheme(ColorScheme colorScheme) => BottomNavigationBarThemeData(
      backgroundColor: colorScheme.secondary,
      selectedItemColor: colorScheme.primaryContainer,
      unselectedItemColor: colorScheme.onSecondary.withOpacity(0.5),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed);

  static final BottomNavigationBarThemeData lightTheme =
      _prepareTheme(AppColorScheme.lightScheme);

  static final BottomNavigationBarThemeData darkTheme =
      _prepareTheme(AppColorScheme.darkScheme);
}
