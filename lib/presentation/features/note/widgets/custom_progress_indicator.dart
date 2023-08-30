import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double size;

  const CustomProgressIndicator({
    Key? key,
    this.size = TAppSize.s10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
              radius: size / 2,
            )
          : SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                color: Theme.of(context).scaffoldBackgroundColor,
              )),
    );
  }
}
