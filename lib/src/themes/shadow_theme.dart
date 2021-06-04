import 'package:flutter/widgets.dart';

import 'package:baratito_ui/src/themes/baratito_palette.dart';

abstract class ShadowTheme {
  @protected
  final BaratitoPalette palette;

  ShadowTheme(this.palette);

  BoxShadow get small;
  BoxShadow get large;
}
