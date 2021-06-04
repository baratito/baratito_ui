import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

enum PrimaryButtonType { regular, expanded }

class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final PrimaryButtonType _type;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.icon,
  })  : _type = PrimaryButtonType.regular,
        super(key: key);

  const PrimaryButton.extended({
    Key? key,
    required this.label,
    this.icon,
  })  : _type = PrimaryButtonType.expanded,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PrimaryButton(
      key: key,
      label: label,
      icon: icon,
      type: _type,
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final PrimaryButtonType type;

  const _PrimaryButton({
    Key? key,
    required this.label,
    this.icon,
    this.type = PrimaryButtonType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentTheme = context.theme.text.primaryButton;
    final borderRadius = BorderRadius.circular(24);
    final maxWidth = 340.0;

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [context.theme.shadows.small],
      ),
      child: Material(
        color: context.theme.colors.primary,
        borderRadius: borderRadius,
        child: InkWell(
          highlightColor: contentTheme.color!.withOpacity(.3),
          splashColor: contentTheme.color!.withOpacity(.05),
          borderRadius: borderRadius,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: _buildContent(context, contentTheme),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TextStyle contentTheme) {
    final isExpanded = type == PrimaryButtonType.expanded;
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
