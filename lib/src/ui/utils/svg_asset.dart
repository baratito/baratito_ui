import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String assetPath;
  final double? size;

  const SvgAsset({
    Key? key,
    required this.assetPath,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      package: 'baratito_ui',
      width: size,
    );
  }
}
