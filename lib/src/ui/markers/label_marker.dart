import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class LabelMarker extends StatelessWidget {
  final String label;
  final Color? color;

  const LabelMarker({
    Key? key,
    required this.label,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildContent(context),
        _buildArrow(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 200,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color ?? context.theme.colors.primary,
        boxShadow: [context.theme.shadows.small],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextOneLine(
              label,
              style: context.theme.text.primaryButton,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrow(BuildContext context) {
    final size = 32.0;
    return ClipPath(
      clipper: ArrowClipper(),
      child: Container(
        width: size,
        height: size,
        color: color ?? context.theme.colors.primary,
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width / 3, 0)
      ..lineTo(size.width / 2, size.height / 3)
      ..lineTo(size.width - size.width / 3, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
