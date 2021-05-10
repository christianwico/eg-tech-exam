import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: _createMaterialColor(Color(0xFFE2288B)),
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Colors.white,
  ),
  primaryTextTheme: GoogleFonts.montserratTextTheme(),
  accentTextTheme: GoogleFonts.montserratTextTheme(),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  primaryIconTheme: IconThemeData(
    color: Colors.white,
  ),
  accentIconTheme: IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    hintStyle: TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
    ),
    prefixStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);

MaterialColor _createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach((strength) {
    final double ds = 0.5 - strength;

    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
