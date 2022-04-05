import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  hintColor: const Color(0xFFC4C4C4),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    headline1: const TextStyle(
      color: Colors.black,
    ),
    headline2: const TextStyle(
      color: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  colorScheme: const ColorScheme.light(
    primary: Colors.white,
    secondary: Color(0xFFFDFCFC),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF0D1321),
  scaffoldBackgroundColor: const Color(0xFF0D1321),
  hintColor: const Color(0xFF1D4C4F),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    headline1: const TextStyle(
      color: Color(0xFFECE9E9),
    ),
    headline2: const TextStyle(
      color: Color(0xFF0D1321),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFFECE9E9),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0D1321),
    secondary: Color(0xFF28B67E),
  ),
);
