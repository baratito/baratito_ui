import 'package:baratito_ui/src/ui/buttons/flat_button_base.dart';
import 'package:flutter/material.dart';

enum SecondaryButtonType { regular, extended }

class SecondaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final SecondaryButtonType _type;

  const SecondaryButton({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
  })  : _type = SecondaryButtonType.regular,
        super(key: key);

  const SecondaryButton.extended({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
  })  : _type = SecondaryButtonType.extended,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExtended = _type == SecondaryButtonType.extended;
    if (isExtended) {
      return FlatButtonBase.extended(
        key: key,
        label: label,
        icon: icon,
        onTap: onTap,
      );
    }
    return FlatButtonBase(
      key: key,
      label: label,
      icon: icon,
      onTap: onTap,
    );
  }
}
