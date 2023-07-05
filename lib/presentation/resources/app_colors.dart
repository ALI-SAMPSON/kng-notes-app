import 'package:flutter/material.dart';

class TAppColors {
  TAppColors._();

  static const tPrimary = Color(0xFF252525);
  static const tSecondary = Color(0xFF3B3B3B);
  static const tFillColor = Color(0xFFEBECEE);
  static const tWhite = Color(0xFFFFFFFF);
  static const tBackground = Color(0xFFFAFAFA);
  static const tGrey = Color(0xFF9A9A9A);
  static const tGreen = Color(0xFF30BE71);
  static const tRed = Color(0xFFFF0000);
  static const tBlue = Colors.blue;
  static const tTextColor = Color(0xFFCFCFCF);
  static const tTransparent = Colors.transparent;

  // colors for shimmer
  static const tGreyColorShade100 = Color(0xFFf5f5f5);
  static const tGreyColorShade300 = Color(0xFFE0E0E0);

  // primary swatch color
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF252525, <int, Color>{
    50: Color(0x1A252525),
    100: Color(0x33252525),
    200: Color(0x4D252525),
    300: Color(0x66252525),
    400: Color(0x80252525),
    500: Color(0xFF252525),
    600: Color(0x99252525),
    700: Color(0x83252525),
    800: Color(0xCC252525),
    900: Color(0xE6252525),
  });
}
