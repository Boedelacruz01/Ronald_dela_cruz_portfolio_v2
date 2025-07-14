import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: const Color(0xFFF5F7FA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF5C6BC0), // Solid color, no gradient
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardColor: const Color(0xFFF0F3FA),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E2C),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardColor: const Color(0xFF1F1F2D),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  );
}
