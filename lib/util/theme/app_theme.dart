import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_fonts.dart';
import 'package:note_taking_app/util/theme/widget_theme/elevated_button_theme.dart';
import 'package:note_taking_app/util/theme/widget_theme/outlined_button_theme.dart';
import 'package:note_taking_app/util/theme/widget_theme/text_field_theme.dart';
import 'package:note_taking_app/util/theme/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: TAppColors.primarySwatch,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: TAppColors.tWhite,
    appBarTheme: const AppBarTheme(
      elevation: TAppElevation.e0,
      backgroundColor: TAppColors.tBackground,
      titleTextStyle: TextStyle(
        fontFamily: TAppFonts.tNunitoMedium,
        color: TAppColors.tSecondary,
      ),
      iconTheme: IconThemeData(
        color: TAppColors.tSecondary,
      ),
    ),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: TAppColors.tPrimary,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(
      elevation: TAppElevation.e0,
      titleTextStyle: TextStyle(
        fontFamily: TAppFonts.tNunitoMedium,
        color: TAppColors.tWhite,
      ),
      iconTheme: IconThemeData(
        color: TAppColors.tWhite,
      ),
    ),
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
  );
}
