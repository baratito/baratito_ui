import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/buttons/solid_button_base.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';

enum PrimaryButtonType { regular, extended }

class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final PrimaryButtonType _type;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
  })  : _type = PrimaryButtonType.regular,
        super(key: key);

  const PrimaryButton.extended({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
  })  : _type = PrimaryButtonType.extended,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExtended = _type == PrimaryButtonType.extended;
    if (isExtended) {
      return SolidButtonBase.extended(
        key: key,
        label: label,
        leading: _buildIcon(context),
        onTap: onTap,
      );
    }
    return SolidButtonBase(
      key: key,
      label: label,
      leading: _buildIcon(context),
      onTap: onTap,
    );
  }

  Widget? _buildIcon(BuildContext context) {
    if (icon == null) return null;

    final contentTheme = context.theme.text.primaryButton;
    final iconSize = contentTheme.fontSize! * 1.5;
    return Icon(
      icon,
      color: contentTheme.color,
      size: iconSize,
    );
  }
}
