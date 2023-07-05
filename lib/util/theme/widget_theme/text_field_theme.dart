import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_fonts.dart';
import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: TAppColors.tFillColor,
    hintStyle: const TextStyle(fontFamily: TAppFonts.tNunitoLight),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: TAppPadding.p25,
      vertical: TAppPadding.p8,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TAppRadius.r32),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TAppRadius.r32),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TAppRadius.r32),
      borderSide: BorderSide.none,
    ),
    prefixIconColor: TAppColors.tGrey,
    suffixIconColor: TAppColors.tGrey,
  );

  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
      filled: true,
      fillColor: TAppColors.tSecondary,
      hintStyle: const TextStyle(fontFamily: TAppFonts.tNunitoLight),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: TAppPadding.p25,
        vertical: TAppPadding.p8,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TAppRadius.r32),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TAppRadius.r32),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TAppRadius.r32),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: TAppColors.tGrey,
      suffixIconColor: TAppColors.tGrey);
}
