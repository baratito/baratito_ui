import 'package:flutter/animation.dart';

extension AnimationExtension on AnimationController {
  Animation<T> curvedAnimation<T>({
    required T begin,
    required T end,
    Curve curve = Curves.easeInOut,
  }) {
    return Tween<T>(begin: begin, end: end).animate(
      CurvedAnimation(curve: curve, parent: this),
    );
  }
}
