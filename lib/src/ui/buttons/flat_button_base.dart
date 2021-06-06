import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

enum FlatButtonBaseType { regular, extended }

class FlatButtonBase extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  /// A [Color] used for the label and the highlight effects of the button.
  final Color? foregroundColor;
  final Color? backgroundColor;
  final FlatButtonBaseType _type;

  const FlatButtonBase({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
    this.foregroundColor,
    this.backgroundColor,
  })  : _type = FlatButtonBaseType.regular,
        super(key: key);

  const FlatButtonBase.extended({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
    this.foregroundColor,
    this.backgroundColor,
  })  : _type = FlatButtonBaseType.extended,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FlatButtonBase(
      key: key,
      label: label,
      icon: icon,
      onTap: onTap,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      type: _type,
    );
  }
}

class _FlatButtonBase extends StatelessWidget {
  final String label;
  final IconData? icon;
  final FlatButtonBaseType type;
  final VoidCallback? onTap;

  /// A [Color] used for the label and the highlight effects of the button.
  final Color? foregroundColor;
  final Color? backgroundColor;

  const _FlatButtonBase({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
    this.foregroundColor,
    this.backgroundColor,
    this.type = FlatButtonBaseType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    final maxWidth = 340.0;
    final _foregroundColor =
        foregroundColor ?? context.theme.text.secondaryButton.color!;
    final _backgroundColor = backgroundColor ?? Colors.transparent;

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Material(
        color: _backgroundColor,
        borderRadius: borderRadius,
        child: InkWell(
          highlightColor: _foregroundColor.withOpacity(.2),
          splashColor: _foregroundColor.withOpacity(.05),
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
    final isExpanded = type == FlatButtonBaseType.extended;
    final hasOnTap = onTap != null;

    final disabledColor = context.theme.colors.disabled;
    final contentTheme = hasOnTap
        ? context.theme.text.secondaryButton.copyWith(color: foregroundColor)
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
        Flexible(
          child: AutoSizeText(label, style: contentTheme, maxLines: 1),
        ),
      ],
    );
  }
}