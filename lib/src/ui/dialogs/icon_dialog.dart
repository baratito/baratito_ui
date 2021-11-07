import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class IconDialog extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final List<Widget>? actions;
  final Color? iconColor;

  const IconDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
    this.actions,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? context.theme.colors.primary;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: context.theme.colors.background,
      title: Row(
        children: [
          Icon(icon, color: color),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: context.theme.text.headline1,
              ),
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      content: Text(content, style: context.theme.text.body),
      actionsPadding: EdgeInsets.all(8),
      actions: actions,
    );
  }
}
