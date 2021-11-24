import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/animations/animations.dart';

class PulseBox extends StatefulWidget {
  final double height;
  final double width;
  final bool _circular;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;

  const PulseBox({
    required this.height,
    required this.width,
    this.margin,
    this.borderRadius,
  }) : _circular = false;

  const PulseBox.circular({
    required double dimension,
    this.margin,
  })  : _circular = true,
        borderRadius = BorderRadius.zero,
        height = dimension,
        width = dimension;

  const PulseBox.square({
    required double dimension,
    this.borderRadius,
    this.margin,
  })  : _circular = false,
        height = dimension,
        width = dimension;

  @override
  _PulseBoxState createState() => _PulseBoxState();
}

class _PulseBoxState extends State<PulseBox>
    with SingleTickerProviderStateMixin {
  final _duration = const Duration(milliseconds: 1600);
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    _pulseController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _pulseAnimation = Tween(begin: 1.0, end: 0.2).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) => _animate());
    super.initState();
  }

  void _animate() {
    _pulseController.repeat(reverse: true);
  }

  final _defaultBorderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    final borderRadius =
        widget._circular ? null : widget.borderRadius ?? _defaultBorderRadius;
    return AnimatedFade(
      animation: _pulseAnimation,
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: context.theme.colors.greyAccent.withOpacity(.2),
          borderRadius: borderRadius,
          shape: widget._circular ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }
}
