import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/items/squircle_border.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';

class SquircleContainer extends StatelessWidget {
  final double? size;

  final Color? backgroundColor;

  /// A [Color] for the squircle's border. Defaults to [backgroundColor].
  final Color? borderColor;

  /// The size the squircle's border. Defaults to `0`.
  final double? borderSize;

  final Widget? child;

  const SquircleContainer({
    Key? key,
    this.backgroundColor,
    this.borderColor,
    this.borderSize,
    this.child,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _borderSize = borderSize ?? 0.0;
    final defaultSize = 72.0;

    var _size = (size ?? defaultSize) - _borderSize;

    final _backgroundColor = backgroundColor ?? context.theme.colors.primary;

    return Material(
      color: _backgroundColor,
      shape: SquircleBorder(
        side: _buildBorderSide(_borderSize),
        superRadius: 20,
      ),
      child: Container(
        height: _size,
        width: _size,
        child: child,
      ),
    );
  }

  BorderSide _buildBorderSide(double borderSideSize) {
    if (borderSideSize == 0) return BorderSide.none;
    return BorderSide(width: borderSideSize, color: borderColor!);
  }
}
