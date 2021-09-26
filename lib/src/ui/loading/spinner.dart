import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = context.theme.colors.spinner;
    final size = context.theme.dimensions.spinner;
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
