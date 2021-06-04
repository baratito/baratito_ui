import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/utils/utils.dart';

class BaratitoLogotype extends StatelessWidget {
  final double size;

  const BaratitoLogotype({
    Key? key,
    this.size = 260,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkmodeActive = context.isDarkmodeActive;
    final assetName = isDarkmodeActive ? 'logotype_darkmode' : 'logotype';
    final assetPath = 'assets/logos/$assetName.svg';
    return SvgAsset(assetPath: assetPath, size: size);
  }
}
