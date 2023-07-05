import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: TAppElevation.e0,
      foregroundColor: TAppColors.tSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TAppPadding.p32),
      ),
      minimumSize: const Size.fromHeight(TAppSize.s45),
      side: const BorderSide(color: TAppColors.tSecondary),
      padding: const EdgeInsets.symmetric(horizontal: TAppPadding.p16),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: TAppElevation.e0,
      foregroundColor: TAppColors.tWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TAppPadding.p32),
      ),
      minimumSize: const Size.fromHeight(TAppSize.s45),
      side: const BorderSide(color: TAppColors.tWhite),
      padding: const EdgeInsets.symmetric(horizontal: TAppPadding.p16),
    ),
  );
}
