import 'package:flutter/material.dart';

class AnimatedTranslation extends AnimatedWidget {
  final Animation<Offset> animation;
  final Widget child;

  const AnimatedTranslation({
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: animation.value,
      child: child,
    );
  }
}
