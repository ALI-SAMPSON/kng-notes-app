import 'package:flutter/material.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,
    required this.promptText,
    required this.linkText,
    required this.onTap,
  });

  final String promptText;
  final String linkText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          text: promptText,
          children: [
            TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: TAppColors.tBlue),
              text: linkText.toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
