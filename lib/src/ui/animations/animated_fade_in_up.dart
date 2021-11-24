import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/animations/animated_fade.dart';
import 'package:baratito_ui/src/ui/extensions/extensions.dart';

class AnimatedFadeInUp extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  const AnimatedFadeInUp({
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final slideWidth = context.screenSize.height * 0.005;

    return AnimatedFade(
      animation: animation,
      child: Transform.translate(
        offset: Offset(0, slideWidth * (1 - animation.value)),
        child: child,
      ),
    );
  }
}
