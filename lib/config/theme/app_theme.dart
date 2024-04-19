import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tennis_court/shared/shared.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData getTheme() {
    return ThemeData(
        colorSchemeSeed: primaryColor,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily);
  }
}
