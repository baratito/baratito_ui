import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/buttons/buttons.dart';
import 'package:baratito_ui/src/ui/dialogs/error_dialog.dart';

class ConfirmErrorDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? confirmButtonLabel;

  const ConfirmErrorDialog({
    Key? key,
    required this.title,
    required this.content,
    this.confirmButtonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final label = confirmButtonLabel ?? 'OK';
    return ErrorDialog(
      title: title,
      content: content,
      actions: <Widget>[
        SizedBox(
          height: 56,
          width: 120,
          child: SecondaryButton(
            label: label,
            onTap: () => _onConfirm(context),
          ),
        )
      ],
    );
  }

  void _onConfirm(BuildContext context) {
    Navigator.of(context).maybePop();
  }
}
