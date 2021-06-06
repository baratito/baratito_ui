import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/animations/animated_fade.dart';

class AnimatedVisibility extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  const AnimatedVisibility({
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final visibility = animation.value;

    return Visibility(
      visible: visibility != 0,
      child: AnimatedFade(
        animation: animation,
        child: child,
      ),
    );
  }
}
