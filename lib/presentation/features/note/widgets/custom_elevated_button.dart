
import 'package:flutter/material.dart';
import 'package:note_taking_app/presentation/features/note/widgets/custom_progress_indicator.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final bool busy;
  final Function() onTap;
  const CustomElevatedButton(
      {Key? key, required this.text, required this.busy, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: busy
          ? const CustomProgressIndicator(
              size: TAppSize.s20,
            )
          : Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: TAppColors.tSecondary),
            ),
    );
  }
}
