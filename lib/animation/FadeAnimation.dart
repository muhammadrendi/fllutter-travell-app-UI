import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({Key? key, required this.delay, required this.child})
      : super(key: key);

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration(milliseconds: 0),
              duration: Duration(milliseconds: 500))
          .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(
              begin: Duration(milliseconds: 0),
              duration: Duration(milliseconds: 500))
          .animate(AniProps.translateY,
              tween: Tween(begin: 120.0, end: 0.0), curve: Curves.easeOut);
    return CustomAnimation<TimelineValue<AniProps>>(
        delay: Duration(milliseconds: (500 * delay).round()),
        duration: tween.duration,
        tween: tween,
        child: child,
        builder: (context, child, value) {
          return Opacity(
            opacity: value.get(AniProps.opacity),
            child: Transform.translate(
              offset: Offset(0, value.get(AniProps.translateY)),
              child: child,
            ),
          );
        });
  }
}
