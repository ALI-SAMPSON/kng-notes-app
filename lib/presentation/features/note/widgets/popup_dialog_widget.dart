import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_fonts.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/util/ext_fxns.dart';

class PopupDialogWidget extends StatelessWidget {
  final String text;
  final String negativeButtonText;
  final String positiveButtonText;
  final Function() onNegativePressed;
  final Function() onPositivePressed;
  const PopupDialogWidget({
    super.key,
    required this.text,
    required this.onNegativePressed,
    this.negativeButtonText = TAppStrings.tDiscard,
    required this.onPositivePressed,
    this.positiveButtonText = TAppStrings.tSave,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          SvgPicture.asset(
            TAssetManager.getIconPath(tInfoSolidIcon),
          ),
          25.ph,
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontFamily: TAppFonts.tNunitoLight,
                      fontWeight: FontWeight.w300,
                      fontSize: TAppSize.s18,
                      color: TAppColors.tTextColor,
                      letterSpacing: TAppSize.s1,
                    ),
              ),
            ),
          ),
          25.ph,
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // discard changes button
                ElevatedButton(
                  onPressed: onNegativePressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TAppColors.tRed,
                      padding: const EdgeInsets.symmetric(
                          horizontal: TAppPadding.p12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(TAppRadius.r5),
                      ),
                      minimumSize: const Size(100, 38)),
                  child: Text(
                    negativeButtonText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: TAppColors.tWhite),
                  ),
                ),
                20.pw,
                // save changes button
                ElevatedButton(
                  onPressed: onPositivePressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TAppColors.tGreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: TAppPadding.p12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(TAppRadius.r5),
                      ),
                      minimumSize: const Size(100, 38)),
                  child: Text(
                    positiveButtonText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: TAppColors.tWhite),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
