import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

enum SecondaryButtonType { regular, expanded }

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
  })  : _type = SecondaryButtonType.expanded,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SecondaryButton(
      key: key,
      label: label,
      icon: icon,
      onTap: onTap,
      type: _type,
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final SecondaryButtonType type;
  final VoidCallback? onTap;

  const _SecondaryButton({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
    this.type = SecondaryButtonType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    final maxWidth = 340.0;

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          highlightColor: context.theme.colors.primary.withOpacity(.2),
          splashColor: context.theme.colors.primary.withOpacity(.05),
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final isExpanded = type == SecondaryButtonType.expanded;
    final hasOnTap = onTap != null;
    
    final disabledColor = context.theme.colors.disabled;
    final contentTheme = hasOnTap
        ? context.theme.text.secondaryButton
        : context.theme.text.secondaryButton.copyWith(color: disabledColor);
    final iconSize = contentTheme.fontSize! * 1.5;

    return Row(
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              icon,
              color: contentTheme.color,
              size: iconSize,
            ),
          ),
        Flexible(child: AutoSizeText(label, style: contentTheme, maxLines: 1)),
      ],
    );
  }
}
