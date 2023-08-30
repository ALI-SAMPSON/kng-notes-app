import 'package:flutter/material.dart';
import 'package:note_taking_app/presentation/features/note/widgets/action_menu_widget.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/util/ext_fxns.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBack;
  final String title;
  final Function() onBackPressed;
  final List<Widget> icons;
  const CustomAppBar({
    super.key,
    this.showBack = false,
    required this.onBackPressed,
    required this.title,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showBack
            ? ActionMenuWidget(
                icon: TAssetManager.getIconPath(tBackIcon),
                onTap: onBackPressed,
              )
            : const SizedBox(),
        showBack ? 20.pw : 0.pw,
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.apply(color: TAppColors.tWhite),
          ),
        ),
        Row(
          children: icons,
        ),
      ],
    );
  }
}
