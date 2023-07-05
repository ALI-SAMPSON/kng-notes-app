import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:flutter/material.dart';

import 'package:flutter_flushbar/flutter_flushbar.dart';

class PopupDialogs {
  PopupDialogs(this.context);
  final BuildContext context;

  void successMessage(String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: TAppColors.tGreen,
      icon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: TAppPadding.p16),
        child: Icon(
          Icons.check_circle,
          color: TAppColors.tWhite,
          size: TAppSize.s20,
        ),
      ),
      messageColor: TAppColors.tWhite,
      message: message,
      duration: const Duration(milliseconds: TAppDuration.d5000),
    ).show(context);
  }

  void errorMessage(String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: TAppColors.tRed,
      icon: const CircleAvatar(
        radius: TAppRadius.r12,
        backgroundColor: TAppColors.tWhite,
        child: Icon(
          Icons.close,
          color: TAppColors.tRed,
          size: TAppSize.s20,
        ),
      ),
      messageColor: TAppColors.tWhite,
      message: message,
      duration: const Duration(milliseconds: TAppDuration.d5000),
    ).show(context);
  }

  void warningMessage(String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: TAppColors.tSecondary,
      icon: const Icon(
        Icons.error,
        color: TAppColors.tWhite,
        size: TAppSize.s20,
      ),
      shouldIconPulse: false,
      messageColor: TAppColors.tWhite,
      message: message,
      duration: const Duration(milliseconds: TAppDuration.d5000),
    ).show(context);
  }
}
