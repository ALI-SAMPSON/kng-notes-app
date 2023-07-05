import 'package:flutter/material.dart';
import 'package:note_taking_app/commons/anim/animation_model.dart';
import 'package:note_taking_app/commons/anim/fade_in_animation_view_model.dart';
import 'package:provider/provider.dart';

class TFadeInAnimation extends StatelessWidget {
  const TFadeInAnimation({
    super.key,
    required this.durationInMs,
    this.animationPosition,
    required this.animate,
    required this.child,
  });

  final int durationInMs;
  final bool animate;
  final Widget child;
  final TAnimationPosition? animationPosition;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: durationInMs),
      top: animate ? animationPosition!.topAfter : animationPosition!.topBefore,
      left: animate
          ? animationPosition!.leftAfter
          : animationPosition!.leftBefore,
      bottom: animate
          ? animationPosition!.bottomAfter
          : animationPosition!.bottomBefore,
      right: animate
          ? animationPosition!.rightAfter
          : animationPosition!.rightBefore,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: durationInMs),
        opacity: animate ? 1 : 0,
        child: child,
      ),
    );
  }
}
