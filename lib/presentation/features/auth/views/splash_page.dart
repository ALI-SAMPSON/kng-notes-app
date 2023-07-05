import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/commons/anim/animation_design.dart';
import 'package:note_taking_app/commons/anim/animation_model.dart';
import 'package:note_taking_app/commons/anim/fade_in_animation_view_model.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/routes/routes.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:note_taking_app/util/helper/size_helper.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: TAppSize.s0, upperBound: double.infinity);
    _simulation = SpringSimulation(
      const SpringDescription(
        mass: TAppOpacity.o0_5,
        stiffness: TAppSize.s80,
        damping: TAppSize.s10,
      ),
      TAppSize.s0, // initial value
      400, // end value
      TAppSize.s0, // velocity value
    );
    _controller.animateWith(_simulation);
    navigateLandingPage();
  }

  // this function navigates user to the
  // landing page after 3 secs
  void navigateLandingPage() {
    Future.delayed(
      const Duration(milliseconds: TAppDuration.d3000),
      () => firebaseAuth.currentUser == null
          ? Navigator.pushNamed(context, Routes.landingRoute)
          : Navigator.pushNamed(context, Routes.noteRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(TAppSize.s150, _controller.value),
            child: Container(
              width: TAppSize.s100,
              height: TAppSize.s100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    TAssetManager.getImagePath(tAppIconDark),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
