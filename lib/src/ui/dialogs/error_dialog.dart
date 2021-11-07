import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/dialogs/icon_dialog.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget>? actions;
  final Color? iconColor;

  const ErrorDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actions,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorColor = iconColor ?? context.theme.colors.primary;
    return IconDialog(
      title: title,
      content: content,
      actions: actions,
      icon: Icons.error,
      iconColor: errorColor,
    );
  }
}
