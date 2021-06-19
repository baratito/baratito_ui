import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class IconActionButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final VoidCallback? onTap;

  IconActionButton({
    Key? key,
    required this.icon,
    this.iconSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _iconSize = iconSize ?? context.theme.dimensions.actionIconLarge;
    final borderRadius = BorderRadius.circular(_iconSize / 1.5);
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
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
