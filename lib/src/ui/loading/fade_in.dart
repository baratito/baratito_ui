import 'package:baratito_ui/src/ui/animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/extensions/extensions.dart';

class FadeIn extends StatefulWidget {
  final Duration? duration;
  final Widget child;

  const FadeIn({
    Key? key,
    required this.child,
    this.duration,
  }) : super(key: key);

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 500),
    );
    _fadeInAnimation = _controller.curvedAnimation(
      begin: 0.0,
      end: 1.0,
      curve: Curves.easeOut,
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeInUp(
      animation: _fadeInAnimation,
      child: widget.child,
    );
  }
}
