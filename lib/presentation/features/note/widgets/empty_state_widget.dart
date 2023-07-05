import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_fonts.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:note_taking_app/util/helper/size_helper.dart';

class EmptyStateWidget extends StatelessWidget {
  final String icon;
  final String text;
  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: TAppSize.s285,
            width: screenWidth(context),
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.cover,
            ),
          ),
          8.ph,
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: TAppColors.tWhite,
                  fontWeight: FontWeight.w300,
                  fontFamily: TAppFonts.tNunitoLight,
                ),
          )
        ],
      ),
    );
  }
}
