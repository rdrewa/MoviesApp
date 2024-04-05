import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final latoTextTheme = GoogleFonts.latoTextTheme();

final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.latoTextTheme().apply(
      bodyColor: Colors.orange,
      displayColor: Colors.blue,
    ).copyWith(
      displayMedium: latoTextTheme.displayMedium?.copyWith(color: Colors.white)
    )
);
