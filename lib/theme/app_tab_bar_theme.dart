import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static TabBarTheme _prepareTheme(ColorScheme colorScheme) => TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: colorScheme.onTertiaryContainer,
      labelColor: colorScheme.onTertiaryContainer,
      unselectedLabelColor: colorScheme.onTertiaryContainer.withOpacity(0.5));

  static TabBarTheme lightTheme = _prepareTheme(AppColorScheme.lightScheme);

  static TabBarTheme darkTheme = _prepareTheme(AppColorScheme.darkScheme);
}
