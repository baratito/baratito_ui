import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/items/squircle_container.dart';

class NetworkImageSquircle extends StatelessWidget {
  final String? imageUrl;

  /// A widget to be displayed when [imageUrl] is `null`
  final Widget? fallbackWidget;

  final double? size;

  final Color? backgroundColor;

  final Color? borderColor;

  final double? borderSize;

  const NetworkImageSquircle({
    Key? key,
    this.imageUrl,
    this.fallbackWidget,
    this.size,
    this.backgroundColor,
    this.borderColor,
    this.borderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor = context.theme.palette.white;
    final _backgroundColor = backgroundColor ?? defaultBackgroundColor;
    final defaultBorderColor = context.theme.colors.border;
    final _borderColor = borderColor ?? defaultBorderColor;

    final defaultBorderSize = 2.0;
    final _borderSize = borderSize ?? defaultBorderSize;

    final defaultSize = context.theme.dimensions.squircleContainer;
    final _size = size ?? defaultSize;

    final imageProvider = _getImageProvider(imageUrl);
    final hasImageProvider = imageProvider != null;

    return SquircleContainer(
      size: _size,
      backgroundColor: _backgroundColor,
      borderSize: _borderSize,
      borderColor: _borderColor,
      child: hasImageProvider ? _buildImage(imageProvider!) : _buildFallback(),
    );
  }

  ImageProvider? _getImageProvider(String? url) {
    if (url == null) return null;
    return CachedNetworkImageProvider(url);
  }

  Widget _buildFallback() {
    return fallbackWidget ?? Container();
  }

  Widget _buildImage(ImageProvider imageProvider) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Image(image: imageProvider),
    );
  }
}
