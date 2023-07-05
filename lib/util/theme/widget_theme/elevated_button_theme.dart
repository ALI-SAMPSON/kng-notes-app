import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/presentation/resources/app_fonts.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(TAppColors.tPrimary),
    elevation: const MaterialStatePropertyAll<double>(TAppElevation.e0),
    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(
          horizontal: TAppPadding.p16, vertical: TAppPadding.p8),
    ),
    minimumSize:
        const MaterialStatePropertyAll<Size>(Size.fromHeight(TAppSize.s45)),
    textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
        fontFamily: TAppFonts.tNunitoRegular, color: TAppColors.tWhite)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TAppRadius.r32))),
    side: const MaterialStatePropertyAll<BorderSide>(
        BorderSide(width: TAppSize.s0)),
  ));

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(TAppColors.tWhite),
    elevation: const MaterialStatePropertyAll<double>(TAppElevation.e0),
    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(
          horizontal: TAppPadding.p16, vertical: TAppPadding.p8),
    ),
    textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
        fontFamily: TAppFonts.tNunitoRegular, color: TAppColors.tSecondary)),
    minimumSize:
        const MaterialStatePropertyAll<Size>(Size.fromHeight(TAppSize.s45)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TAppRadius.r32))),
    side: const MaterialStatePropertyAll<BorderSide>(
        BorderSide(width: TAppSize.s0)),
  ));
}
