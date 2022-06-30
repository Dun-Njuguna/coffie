import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextColor,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.lightTextColor,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: AppColors.lightTextColor,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextColor,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextColor,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextColor,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.darkTextColor,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: AppColors.darkTextColor,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextColor,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextColor,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextColor,
    ),
  );

  static ButtonThemeData lightButtonTheme = const ButtonThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.lightButtonColor,
      secondary: AppColors.secondaryLightButtonColor,
    ),
    textTheme: ButtonTextTheme.normal,
  );

  static ButtonThemeData darkButtonTheme = const ButtonThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkButtonColor,
      secondary: AppColors.secondaryDarkButtonColor,
    ),
    textTheme: ButtonTextTheme.normal,
  );

  static ThemeData light() {
    return ThemeData(
        primaryColor: AppColors.lightMainColor,
        primaryColorDark: AppColors.lightButtonColor,
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            return Colors.black;
          }),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        navigationBarTheme: const NavigationBarThemeData(
            backgroundColor: AppColors.lightMainColor,
            indicatorColor: AppColors.darkButtonColor,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected),
        textTheme: lightTextTheme,
        buttonTheme: lightButtonTheme,
        scaffoldBackgroundColor: AppColors.lightMainColor);
  }

  static ThemeData dark() {
    return ThemeData(
      primaryColor: AppColors.darkMainColor,
      primaryColorDark: AppColors.darkButtonColor,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.darkMainColor,
      ),
      navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.darkMainColor,
          indicatorColor: AppColors.darkButtonColor,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected),
      textTheme: darkTextTheme,
      buttonTheme: darkButtonTheme,
      scaffoldBackgroundColor: AppColors.darkMainColor,
    );
  }
}
