import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/presentation/features/note/widgets/popup_dialog_widget.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';

Future buildChangesDialog({
  required BuildContext context,
  required String text,
  required Function() onNegativePressed,
  required Function() onPositivePressed,
}) {
  return showAnimatedDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: TAppColors.tPrimary,
        insetPadding: const EdgeInsets.all(TAppPadding.p4),
        elevation: TAppElevation.e0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TAppRadius.r20),
        ),
        content: PopupDialogWidget(
          text: text,
          onNegativePressed: onNegativePressed,
          onPositivePressed: onPositivePressed,
        ),
      );
    },
    animationType: DialogTransitionType.fadeScale,
    curve: Curves.fastOutSlowIn,
    duration:
        const Duration(milliseconds: TAppConstants.tDialogAnimDurationInSc),
  );
}
