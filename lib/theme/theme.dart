import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColorLight = Color(0X80E0E7FF);
final backgroundColorLight = Colors.green[50];
const textColorLight = Color(0xff131313);
final scaffoldBackgroundColorLight = Colors.grey[50];
final switchColorLight = Color(0xff73C0FC);

final primaryColorDark = Color(0X80E0E7FF);
const backgroundColorDark = Color(0xFF191919);
const textColorDark = Colors.white;
final scaffoldBackgroundColorDark = Color(0xFF121212);
final switchColorDark = Color(0xff004884);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColorLight,
  scaffoldBackgroundColor: backgroundColorLight,
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: textColorLight,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 28 / 20,
      letterSpacing: 0,
    ),
    bodyMedium: const TextStyle(
      color: textColorLight,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 28 / 16,
      letterSpacing: 0,
    ),
    bodySmall: const TextStyle(
      color: textColorLight,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColorDark,
  scaffoldBackgroundColor: backgroundColorDark,
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: textColorDark,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 28 / 20,
      letterSpacing: 0,
    ),
    bodyMedium: TextStyle(
      color: textColorDark,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 28 / 16,
      letterSpacing: 0,
    ),
    bodySmall: TextStyle(
      color: textColorDark,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
    ),
  ),
);
