import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

class CircleBorderAvatar extends StatelessWidget {
  final String avatarUrl;
  final double? size;

  const CircleBorderAvatar({
    Key? key,
    required this.avatarUrl,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = context.theme.colors.greyAccent;
    const borderWidth = 2.0;
    final avatarSize = size ?? context.theme.dimensions.avatar;
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: CircleBorder()),
        child: CachedNetworkImage(imageUrl: avatarUrl, fit: BoxFit.cover),
      ),
    );
  }
}
