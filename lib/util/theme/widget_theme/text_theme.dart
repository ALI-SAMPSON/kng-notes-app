import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_fonts.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoBold,
      color: TAppColors.tPrimary,
    ),
    displayMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    displaySmall: TextStyle(
      fontFamily: TAppFonts.tNunitoRegular,
      color: TAppColors.tPrimary,
    ),
    headlineLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    headlineMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    headlineSmall: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    titleLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    titleMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    titleSmall: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    bodyLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tPrimary,
    ),
    bodyMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoRegular,
      color: TAppColors.tPrimary,
    ),
    bodySmall: TextStyle(
      fontFamily: TAppFonts.tNunitoLight,
      color: TAppColors.tPrimary,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoBold,
      color: TAppColors.tWhite,
    ),
    displayMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tWhite,
    ),
    displaySmall: TextStyle(
      fontFamily: TAppFonts.tNunitoRegular,
      color: TAppColors.tWhite,
    ),
    headlineLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoBold,
      color: TAppColors.tWhite,
    ),
    headlineMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tWhite,
    ),
    headlineSmall: TextStyle(
      fontFamily: TAppFonts.tNunitoRegular,
      color: TAppColors.tWhite,
    ),
    titleLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoBold,
      color: TAppColors.tWhite,
    ),
    titleMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tWhite,
    ),
    titleSmall: TextStyle(
      fontFamily: TAppFonts.tNunitoRegular,
      color: TAppColors.tWhite,
    ),
    bodyLarge: TextStyle(
      fontFamily: TAppFonts.tNunitoBold,
      color: TAppColors.tWhite,
    ),
    bodyMedium: TextStyle(
      fontFamily: TAppFonts.tNunitoMedium,
      color: TAppColors.tWhite,
    ),
    bodySmall: TextStyle(
      fontFamily: TAppFonts.tNunitoRegular,
      color: TAppColors.tWhite,
    ),
  );
}
