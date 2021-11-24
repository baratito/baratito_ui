import 'package:baratito_ui/src/ui/animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/extensions/animation_extension.dart';

class LoadingCrossfade extends StatefulWidget {
  final bool isLoading;

  /// A Widget to show when [isLoading] is `true`
  final Widget loadingWidget;

  final Widget child;

  const LoadingCrossfade({
    Key? key,
    required this.loadingWidget,
    required this.child,
    this.isLoading = true,
  }) : super(key: key);

  @override
  _LoadingCrossfadeState createState() => _LoadingCrossfadeState();
}

class _LoadingCrossfadeState extends State<LoadingCrossfade>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late bool _showLoading;

  final _crossfadeDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeInAnimation = _controller.curvedAnimation(
      begin: 0.0,
      end: 1.0,
      curve: Interval(.5, 1, curve: Curves.easeOut),
    );
    _showLoading = widget.isLoading;
    if (!_showLoading) _controller.value = 1.0;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> showChild() async {
    setState(() => _showLoading = false);
    await Future.delayed(_crossfadeDuration);
    await _controller.forward().orCancel;
  }

  Future<void> showLoading() async {
    await _controller.reverse().orCancel;
    setState(() => _showLoading = true);
  }

  @override
  void didUpdateWidget(covariant LoadingCrossfade oldWidget) {
    if (oldWidget.isLoading != widget.isLoading) {
      if (widget.isLoading) {
        showLoading();
        return;
      }
      showChild();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final state =
        _showLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond;
    return AnimatedCrossFade(
      crossFadeState: state,
      duration: _crossfadeDuration,
      firstCurve: Curves.easeInOut,
      firstChild: widget.loadingWidget,
      secondChild: AnimatedFadeInUp(
        animation: _fadeInAnimation,
        child: widget.child,
      ),
    );
  }
}
