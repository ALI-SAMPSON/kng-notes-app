import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:note_taking_app/util/helper/size_helper.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String icon;
  final String title;
  final String subTitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          SvgPicture.asset(
            icon,
            height: screenHeight(context) * 0.30,
          ),
          10.ph,
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          10.ph,
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
