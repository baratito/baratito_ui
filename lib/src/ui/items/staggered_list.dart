import 'package:baratito_ui/src/ui/animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/extensions/extensions.dart';

class StaggeredList extends StatefulWidget {
  final List<Widget> children;
  final Duration itemFadeInDuration;
  final Duration staggerDelay;
  final Duration initialDelay;

  const StaggeredList({
    Key? key,
    required this.children,
    this.itemFadeInDuration = const Duration(milliseconds: 500),
    this.staggerDelay = const Duration(milliseconds: 300),
    this.initialDelay = Duration.zero,
  }) : super(key: key);

  @override
  _StaggeredListState createState() => _StaggeredListState();
}

class _StaggeredListState extends State<StaggeredList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Duration _totalAnimationDuration = Duration.zero;

  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    _setTotalAnimationDuration();
    _controller = AnimationController(
      vsync: this,
      duration: _totalAnimationDuration,
    );
    _setUpAnimations();
    _controller.forward();
    super.initState();
  }

  void _setTotalAnimationDuration() {
    final initialDelay = widget.initialDelay;
    final staggerDelay = widget.staggerDelay * widget.children.length;
    final itemsFadeInDelay = widget.itemFadeInDuration * widget.children.length;
    _totalAnimationDuration = initialDelay + staggerDelay + itemsFadeInDelay;
  }

  void _setUpAnimations() {
    for (var i = 0; i < widget.children.length; i++) {
      final startTime = widget.initialDelay + (widget.staggerDelay * i);
      final endTime = startTime + widget.itemFadeInDuration;
      final totalDurationMilliseconds = _totalAnimationDuration.inMilliseconds;
      print('total duration millist $totalDurationMilliseconds');
      _animations.add(
        _controller.curvedAnimation(
          begin: 0.0,
          end: 1.0,
          curve: Interval(
            startTime.inMilliseconds / totalDurationMilliseconds,
            endTime.inMilliseconds / totalDurationMilliseconds,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < widget.children.length; i++)
            AnimatedFade(
              animation: _animations[i],
              child: widget.children[i],
            ),
        ],
      ),
    );
  }
}
