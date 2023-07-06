import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';

class CustomFabButton extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const CustomFabButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(TAppRadius.r32),
      child: Container(
        width: TAppSize.s70,
        height: TAppSize.s70,
        padding: const EdgeInsets.all(TAppPadding.p12),
        decoration: BoxDecoration(
            color: TAppColors.tPrimary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                spreadRadius: TAppSize.s0,
                blurRadius: TAppSize.s10,
                offset: const Offset(TAppSize.s_5, TAppSize.s0),
                color: TAppColors.tBlack.withOpacity(TAppOpacity.o0_4),
              ),
              BoxShadow(
                spreadRadius: TAppSize.s0,
                blurRadius: TAppSize.s10,
                offset: const Offset(TAppSize.s0, TAppSize.s5),
                color: TAppColors.tBlack.withOpacity(TAppOpacity.o0_4),
              ),
            ]),
        child: SvgPicture.asset(
          icon,
          width: TAppSize.s40,
          height: TAppSize.s40,
        ),
      ),
    );
  }
}
