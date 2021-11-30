import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class IconMarker extends StatelessWidget {
  final IconData icon;
  final Color? color;

  const IconMarker({
    Key? key,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildContent(context),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: _buildPointer(context),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? context.theme.colors.primary,
        boxShadow: [context.theme.shadows.small],
      ),
      child: Icon(icon, color: context.theme.colors.iconAction),
    );
  }

  Widget _buildPointer(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? context.theme.colors.primary,
      ),
    );
  }
}
