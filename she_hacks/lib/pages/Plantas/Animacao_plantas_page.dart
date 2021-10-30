import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateX }

class Animacao_plantas_page extends StatelessWidget {
  final double delay;
  final Widget child;

  const Animacao_plantas_page(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(AnimationType.opacity, Tween(begin: 0.0, end: 1.0),
          Duration(milliseconds: 500),)
      ..add(
        AnimationType.translateX,
        Tween(begin: 30.0, end: 1.0),
        Duration(milliseconds: 500),
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX), 0),
            child: child
        ),
      ),
    );
  }
}