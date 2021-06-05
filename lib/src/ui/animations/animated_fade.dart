import 'package:flutter/material.dart';

class AnimatedFade extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  const AnimatedFade({
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final opacity = animation.value;

    return IgnorePointer(
      ignoring: opacity < 1,
      child: Opacity(
        opacity: opacity,
        child: child,
      ),
    );
  }
}
