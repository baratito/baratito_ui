import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:baratito_ui/src/ui/items/squircle_container.dart';

class NetworkImageSquircle extends StatelessWidget {
  final String? imageUrl;

  /// A widget to be displayed when [imageUrl] is `null` or an error occurs
  /// whilst loading the image
  final Widget? fallbackWidget;

  /// A widget to be displayed when the image is loading
  final Widget? loadingWidget;

  final double? size;

  final Color? backgroundColor;

  final Color? borderColor;

  final double? borderSize;

  const NetworkImageSquircle({
    Key? key,
    this.imageUrl,
    this.fallbackWidget,
    this.loadingWidget,
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

    final hasImageUrl = imageUrl != null;

    return SquircleContainer(
      size: _size,
      backgroundColor: _backgroundColor,
      borderSize: _borderSize,
      borderColor: _borderColor,
      child: hasImageUrl ? _buildImage() : _buildFallback(),
    );
  }

  Widget _buildFallback() {
    return fallbackWidget ?? Container();
  }

  Widget _buildLoading() {
    return loadingWidget ?? Container();
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (_, provider) {
        return Container(
          margin: const EdgeInsets.all(4),
          child: Image(image: provider),
        );
      },
      placeholder: (_, __) => _buildLoading(),
      errorWidget: (_, __, ___) => _buildFallback(),
    );
  }
}
