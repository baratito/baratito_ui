import 'package:flutter/widgets.dart';

import 'package:baratito_ui/src/themes/baratito_palette.dart';

abstract class ColorTheme {
  @protected
  final BaratitoPalette palette;

  ColorTheme(this.palette);

  Color get primary;
  Color get cyanAccent;
  Color get redAccent;
  Color get greenAccent;
  Color get greyAccent;
  Color get greyBackground;
  Color get disabled;

  Color get background;
  Color get input;
  Color get iconAction;
  Color get border;
}
