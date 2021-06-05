import 'package:flutter/material.dart';

import 'package:baratito_ui/icons/baratito_icons.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/animations/animations.dart';
import 'package:baratito_ui/src/ui/buttons/icon_action_button.dart';

class NotificationsButton extends StatefulWidget {
  final bool showIndicator;
  final VoidCallback? onTap;

  const NotificationsButton({
    Key? key,
    this.showIndicator = false,
    this.onTap,
  }) : super(key: key);

  @override
  _NotificationsButtonState createState() => _NotificationsButtonState();
}

class _NotificationsButtonState extends State<NotificationsButton>
    with TickerProviderStateMixin {
  final _fadeDuration = Duration(milliseconds: 200);
  final _slideDuration = Duration(seconds: 1);

  late AnimationController _fadeController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    setUpControllers();
    setUpAnimations();

    if (widget.showIndicator) {
      WidgetsBinding.instance?.addPostFrameCallback((_) => forward());
    }
  }

  @override
  void didUpdateWidget(covariant NotificationsButton oldWidget) {
    final shouldAnimate = oldWidget.showIndicator != widget.showIndicator;
    if (shouldAnimate) {
      if (widget.showIndicator) {
        forward();
      } else {
        reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void setUpControllers() {
    _fadeController = AnimationController(
      vsync: this,
      duration: _fadeDuration,
    );

    _slideController = AnimationController(
      vsync: this,
      duration: _slideDuration,
    );
  }

  void setUpAnimations() {
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.ease,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 30),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.elasticOut,
      ),
    );
  }

  void forward() {
    _slideController.forward();
    _fadeController.forward();
  }

  Future<void> reverse() async {
    await _fadeController.reverse();
    _slideController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconActionButton(
          icon: BaratitoIcons.notification,
          onTap: widget.onTap,
        ),
        Positioned(
          top: 12,
          right: 14,
          child: AnimatedFade(
            animation: _fadeAnimation,
            child: AnimatedTranslation(
              animation: _slideAnimation,
              child: _buildIndicator(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(BuildContext context) {
    final size = 12.0;
    return IgnorePointer(
      ignoring: true,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.colors.redAccent,
        ),
      ),
    );
  }
}
