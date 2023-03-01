import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/core/theme/colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: nightthemeColor, modalBackgroundColor: nightthemeColor),
  primaryColor: primaryColor,
  backgroundColor: nightthemeColor,
  primaryTextTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
      decorationColor: Colors.white),
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: nightthemeColor,
    elevation: 0,
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
      decorationColor: Colors.white),
  scaffoldBackgroundColor: nightthemeColor,
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.white,
    hintStyle: const TextStyle(color: Colors.white),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor, width: 2),
        borderRadius: BorderRadius.circular(10)),
  ),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white, modalBackgroundColor: Colors.white),
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    //foregroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    //shadowColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: GoogleFonts.poppinsTextTheme()
      .apply(bodyColor: Colors.black, displayColor: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: primaryColor,
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor, width: 2),
        borderRadius: BorderRadius.circular(10)),
  ),
);

bool isdarkTheme(BuildContext context) {
  return Theme.of(context) == darkTheme;
}
