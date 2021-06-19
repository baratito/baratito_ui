import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:baratito_ui/icons/baratito_icons.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';

class SelectionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const SelectionButton({Key? key, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);
    final maxWidth = context.theme.dimensions.extendedButton;

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          highlightColor: context.theme.colors.greyAccent.withOpacity(.2),
          splashColor: context.theme.colors.greyAccent.withOpacity(.05),
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final hasOnTap = onTap != null;

    final contentColor = context.theme.colors.greyAccent;
    final disabledColor = context.theme.colors.disabled;
    final contentTheme = hasOnTap
        ? context.theme.text.primaryButton.copyWith(color: contentColor)
        : context.theme.text.primaryButton.copyWith(color: disabledColor);
    final iconSize = contentTheme.fontSize;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: AutoSizeText(label, style: contentTheme, maxLines: 1)),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Icon(
            BaratitoIcons.arrowDown,
            color: contentTheme.color,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}
