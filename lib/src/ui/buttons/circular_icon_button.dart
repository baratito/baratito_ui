import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final VoidCallback? onTap;

  CircularIconButton({
    Key? key,
    required this.icon,
    this.iconSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _iconSize = iconSize ?? context.theme.dimensions.actionIconLarge;
    final hasOnTap = onTap != null;
    final borderRadius = BorderRadius.circular(_iconSize);
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          if (hasOnTap) context.theme.shadows.small,
        ],
      ),
      child: Material(
        color: context.theme.colors.background,
        borderRadius: borderRadius,
        child: InkWell(
          highlightColor: context.theme.colors.iconAction.withOpacity(.2),
          splashColor: context.theme.colors.iconAction.withOpacity(.05),
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: _buildContent(context, _iconSize),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, double size) {
    final hasOnTap = onTap != null;

    final defaultColor = context.theme.colors.iconAction;
    final disabledColor = context.theme.colors.disabled;

    final iconColor = hasOnTap ? defaultColor : disabledColor;

    return Icon(
      icon,
      color: iconColor,
      size: size,
    );
  }
}
