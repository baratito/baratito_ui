import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/utils/utils.dart';

class BaratitoIsotype extends StatelessWidget {
  final double size;

  const BaratitoIsotype({
    Key? key,
    this.size = 28,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkmodeActive = context.isDarkmodeActive;
    final assetName =
        isDarkmodeActive ? 'isotype_color_darkmode' : 'isotype_color';
    final assetPath = 'assets/logos/$assetName.svg';
    return SvgAsset(assetPath: assetPath, size: size);
  }
}
