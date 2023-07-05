import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/util/date_util.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:flutter/material.dart';

class ChatShimmerWidget extends StatelessWidget {
  const ChatShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: TAppPadding.p14),
      padding: const EdgeInsets.all(TAppPadding.p12),
      decoration: BoxDecoration(
        color: TAppColors.tWhite,
        borderRadius: BorderRadius.circular(TAppRadius.r8),
      ),
      child: Row(
        children: [
          // user profile photo
          Container(
            width: TAppSize.s50,
            height: TAppSize.s50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: TAppColors.tGreyColorShade300,
            ),
          ),
          10.pw,
          // Column for username and last message
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: TAppSize.s16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(TAppRadius.r10),
                    color: TAppColors.tGreyColorShade300,
                  ),
                ),
                10.ph,
                Container(
                  height: TAppSize.s16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(TAppRadius.r10),
                    color: TAppColors.tGreyColorShade300,
                  ),
                ),
              ],
            ),
          ),
          10.pw,
          // last message time
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: TAppSize.s50,
                height: TAppSize.s16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TAppRadius.r10),
                  color: TAppColors.tGreyColorShade300,
                ),
              ),
              10.ph,
              const CircleAvatar(
                radius: TAppRadius.r10,
                backgroundColor: TAppColors.tGreyColorShade300,
              )
            ],
          ),
        ],
      ),
    );
  }
}
