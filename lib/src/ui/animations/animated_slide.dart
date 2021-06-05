import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/extensions/extensions.dart';

class AnimatedSlide extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  const AnimatedSlide({
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final slideWidth = context.screenSize.width * 0.3;

    return Transform.translate(
      offset: Offset(slideWidth * (1 - animation.value), 0),
      child: child,
    );
  }
}
