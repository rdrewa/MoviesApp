import 'package:flutter/material.dart';

extension BuildContextThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  TextStyle? get titleMedium => textTheme.titleMedium;

  TextStyle? get labelMedium => textTheme.labelMedium;

  TextStyle? get headlineMedium => textTheme.headlineMedium;

  TextStyle? get bodySmall => textTheme.bodySmall;
}
