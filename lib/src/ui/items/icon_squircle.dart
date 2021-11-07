import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/items/squircle_container.dart';

class IconSquircle extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderSize;

  const IconSquircle({
    Key? key,
    required this.icon,
    this.size,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
    this.borderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _iconColor = iconColor ?? context.theme.colors.primary;
    final defaultBackgroundColor = context.theme.colors.primary.withOpacity(.2);
    final _backgroundColor = backgroundColor ?? defaultBackgroundColor;
    final _borderColor = borderColor ?? defaultBackgroundColor;

    return SquircleContainer(
      size: size,
      backgroundColor: _backgroundColor,
      borderColor: _borderColor,
      borderSize: borderSize,
      child: Icon(
        icon,
        size: context.theme.dimensions.squircleContainerIcon,
        color: _iconColor,
      ),
    );
  }
}
