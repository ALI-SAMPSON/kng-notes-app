import 'package:flutter/material.dart';
import 'package:note_taking_app/app/app_constants.dart';

class FadeInAnimationViewModel extends ChangeNotifier {
  bool _animate = false;

  bool get animate => _animate;

  // update animation state
  void setAnimate(bool animate) {
    _animate = animate;
    notifyListeners();
  }

  // start animation
  Future<void> startAnimation() async {
    await Future.delayed(
        const Duration(milliseconds: TAppConstants.tDialogAnimDurationInSc));
    setAnimate(true);
  }
}
