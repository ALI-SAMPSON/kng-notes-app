import 'package:flutter/material.dart';
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
class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  late FadeInAnimationViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = context.watch<FadeInAnimationViewModel>();
    _viewModel.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          // this widget contains both animated
          // positioned and animated opacity to animate view
          TFadeInAnimation(
            durationInMs: TAppConstants.tDuration1200,
            animate: _viewModel.animate,
            animationPosition: TAnimationPosition(
              bottomAfter: TAppSize.s0,
              bottomBefore: TAppSize.s_100,
              topAfter: TAppSize.s0,
              topBefore: TAppSize.s0,
              leftAfter: TAppSize.s0,
              leftBefore: TAppSize.s0,
              rightAfter: TAppSize.s0,
              rightBefore: TAppSize.s0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(TAppPadding.p20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    TAssetManager.getIconPath(tNoteIcon),
                    height: screenHeight(context) * 0.50,
                  ),
                  Column(
                    children: [
                      Text(
                        TAppStrings.tWelcomeTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      10.ph,
                      Text(
                        TAppStrings.tWelcomeSubTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  //50.ph,
                  // row for outline and elevated button
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          color: TAppColors.tTransparent,
                          child: Hero(
                            tag: 0,
                            child: OutlinedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, Routes.loginRoute),
                              child: Text(
                                TAppStrings.tLogin.toUpperCase(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.pw,
                      Expanded(
                        child: Material(
                          color: TAppColors.tTransparent,
                          child: Hero(
                            tag: 1,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, Routes.signUpRoute),
                              child: Text(
                                TAppStrings.tSignup.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: TAppColors.tSecondary),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
