import 'package:flutter/cupertino.dart';

Size screenSize(BuildContext context) => MediaQuery.of(context).size;
double screenWidth(BuildContext context) => screenSize(context).width;
double screenHeight(BuildContext context) => screenSize(context).height;
