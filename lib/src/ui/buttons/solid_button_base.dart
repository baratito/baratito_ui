import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

enum SolidButtonBaseType { regular, expanded }

class SolidButtonBase extends StatelessWidget {
  final String label;

  final Widget? leading;

  final VoidCallback? onTap;

  /// A [Color] used for the label and the highlight effects of the button.
  final Color? foregroundColor;

  final Color? backgroundColor;

  final SolidButtonBaseType _type;

  const SolidButtonBase({
    Key? key,
    required this.label,
    this.leading,
    this.onTap,
    this.foregroundColor,
    this.backgroundColor,
  })  : _type = SolidButtonBaseType.regular,
        super(key: key);

  const SolidButtonBase.extended({
    Key? key,
    required this.label,
    this.leading,
    this.onTap,
    this.foregroundColor,
    this.backgroundColor,
  })  : _type = SolidButtonBaseType.expanded,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SolidButtonBase(
      key: key,
      label: label,
      leading: leading,
      onTap: onTap,
      type: _type,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
    );
  }
}

class _SolidButtonBase extends StatelessWidget {
  final String label;

  final Widget? leading;

  final VoidCallback? onTap;

  final SolidButtonBaseType type;

  // A [Color] used for the label and the highlight effects of the button.
  final Color? foregroundColor;

  final Color? backgroundColor;

  const _SolidButtonBase({
    Key? key,
    required this.label,
    this.leading,
    this.onTap,
    this.foregroundColor,
    this.backgroundColor,
    this.type = SolidButtonBaseType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentTheme = context.theme.text.primaryButton.copyWith(
      color: foregroundColor,
    );
    final colorTheme = context.theme.colors;
    final _backgroundColor = backgroundColor ?? colorTheme.primary;

    final borderRadius = BorderRadius.circular(24);
    final maxWidth = context.theme.dimensions.extendedButton;
    final hasOnTap = onTap != null;

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          if (hasOnTap) context.theme.shadows.small,
        ],
      ),
      child: Material(
        color: hasOnTap ? _backgroundColor : colorTheme.disabled,
        borderRadius: borderRadius,
        child: InkWell(
          highlightColor: contentTheme.color!.withOpacity(.3),
          splashColor: contentTheme.color!.withOpacity(.05),
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: _buildContent(context, contentTheme),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TextStyle contentTheme) {
    final isExpanded = type == SolidButtonBaseType.expanded;
    return Row(
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null)
          leading!,
        Flexible(child: AutoSizeText(label, style: contentTheme, maxLines: 1)),
      ],
    );
  }
}
