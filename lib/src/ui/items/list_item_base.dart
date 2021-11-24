import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class ListItemBase extends StatefulWidget {
  final String title;

  final String? subtitle1;

  final Color? subtitle1Color;

  final String? subtitle2;

  final Color? subtitle2Color;

  final Widget? leading;

  final Widget? trailing;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPressed;

  const ListItemBase({
    Key? key,
    required this.title,
    this.subtitle1,
    this.subtitle1Color,
    this.subtitle2,
    this.subtitle2Color,
    this.leading,
    this.trailing,
    this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  @override
  _ListItemBaseState createState() => _ListItemBaseState();
}

class _ListItemBaseState extends State<ListItemBase>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool _pressedDown = false;

  @override
  void initState() {
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: .99).animate(
      CurvedAnimation(
        curve: Curves.easeInOut,
        parent: _scaleController,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filterColor = context.theme.colors.background;
    return GestureDetector(
      onTapDown: (_) => _onTapDown(),
      onTapUp: (_) => _onTapUp(),
      onTapCancel: _reverseAnimation,
      onLongPress: _onLongTap,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            filterColor.withOpacity(.3),
            _pressedDown ? BlendMode.srcATop : BlendMode.dst,
          ),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.leading != null) widget.leading!,
        Expanded(child: _buildTexts()),
        if (widget.trailing != null) widget.trailing!,
      ],
    );
  }

  Widget _buildTexts() {
    final titleStyle = context.theme.text.itemTitle;
    final subtitle1Style = context.theme.text.itemSubtitle1.copyWith(
      color: widget.subtitle1Color,
    );
    final subtitle2Style = context.theme.text.itemSubtitle2.copyWith(
      color: widget.subtitle2Color,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildText(widget.title, titleStyle),
        if (widget.subtitle1 != null)
          _buildText(widget.subtitle1!, subtitle1Style),
        if (widget.subtitle2 != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: _buildText(widget.subtitle2!, subtitle2Style),
          ),
      ],
    );
  }

  Widget _buildText(String text, TextStyle style) {
    return Row(
      children: [
        Flexible(
          child: TextOneLine(
            text,
            overflow: TextOverflow.fade,
            style: style,
          ),
        ),
      ],
    );
  }

  void _onLongTap() {
    if (widget.onLongPressed != null) {
      widget.onLongPressed!();
    }
  }

  void _onTapDown() {
    if (widget.onPressed == null) return;
    _setPressedDown(true);
    _scaleController.forward();
  }

  void _onTapUp() {
    if (widget.onPressed == null) return;

    widget.onPressed!();

    final animationIsRunning = _scaleController.isAnimating;
    if (animationIsRunning) {
      _scaleController.addStatusListener(_onTapUpStatusListener);
      return;
    }
    _reverseAnimation();
  }

  void _reverseAnimation() {
    _scaleController.reverse();
    _setPressedDown(false);
  }

  void _onTapUpStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _reverseAnimation();
      _scaleController.removeStatusListener(_onTapUpStatusListener);
    }
  }

  void _setPressedDown(bool value) {
    setState(() => _pressedDown = value);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }
}
