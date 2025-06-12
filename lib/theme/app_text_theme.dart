import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme get textTheme => TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.quicksand(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
    ),
    headlineMedium: GoogleFonts.merriweather(
      fontWeight: FontWeight.normal,
    ),
    headlineLarge: GoogleFonts.merriweather(
      fontWeight: FontWeight.bold,
    ),
  );
}
