import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/buttons/buttons.dart';
import 'package:baratito_ui/src/ui/items/icon_squircle.dart';
import 'package:baratito_ui/src/ui/items/list_item_base.dart';

class IconListItem extends StatelessWidget {
  final String title;

  final IconData icon;

  final Color? iconColor;

  final String? subtitle1;

  final Color? subtitle1Color;

  final String? subtitle2;

  final Color? subtitle2Color;

  /// An icon to be shown on the right-hand side of the list item whenever
  /// [onPressed] or [onLongPressed] are present.
  final IconData? actionIcon;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPressed;

  const IconListItem({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor,
    this.subtitle1,
    this.subtitle1Color,
    this.subtitle2,
    this.subtitle2Color,
    this.actionIcon,
    this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListItemBase(
      title: title,
      subtitle1: subtitle1,
      subtitle1Color: subtitle1Color,
      subtitle2: subtitle2,
      subtitle2Color: subtitle2Color,
      leading: _buildLeading(context),
      trailing: _buildTrailing(context),
      onPressed: onPressed,
      onLongPressed: onLongPressed,
    );
  }

  Widget _buildLeading(BuildContext context) {
    final color = iconColor ?? context.theme.colors.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: IconSquircle(
        icon: icon,
        iconColor: color,
        backgroundColor: color.withOpacity(.2),
      ),
    );
  }

  Widget? _buildTrailing(BuildContext context) {
    if (actionIcon == null) return null;
    if (onPressed == null && onLongPressed == null) return null;
    return IgnorePointer(
      ignoring: true,
      child: IconActionButton(
        icon: actionIcon!,
        onTap: () {},
      ),
    );
  }
}
