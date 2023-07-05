import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';

class ActionMenuWidget extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const ActionMenuWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TAppColors.tTransparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: TAppSize.s50,
          height: TAppSize.s50,
          //margin: const EdgeInsets.only(right: TAppPadding.p18),
          padding: const EdgeInsets.all(TAppPadding.p14),
          decoration: BoxDecoration(
              color: TAppColors.tSecondary,
              borderRadius: BorderRadius.circular(TAppRadius.r15)),
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
