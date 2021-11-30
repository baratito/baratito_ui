import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class Spinner extends StatelessWidget {
  final double? size;

  const Spinner({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = context.theme.colors.spinner;
    final _size = size ?? context.theme.dimensions.spinner;
    return SizedBox.square(
      dimension: _size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
