import 'package:flutter/widgets.dart';

import 'package:baratito_ui/src/themes/baratito_palette.dart';

abstract class ColorTheme {
  @protected
  final BaratitoPalette palette;

  ColorTheme(this.palette);

  // General
  Color get primary;
  Color get cyanAccent;
  Color get redAccent;
  Color get greenAccent;
  Color get greyAccent;
  Color get greyBackground;
  Color get blueAccent;
  Color get brownAccent;
  Color get pinkAccent;
  Color get mauveAccent;
  Color get orangeAccent;
  Color get aquamarineAccent;
  Color get lightblueAccent;
  Color get lilacAccent;
  Color get salmonAccent;

  // UI components
  Color get background;
  Color get input;
  Color get iconAction;
  Color get spinner;
  Color get border;
  Color get dragLine;
  Color get disabled;
  Color get socialAuthGoogle;
  Color get socialAuthFacebook;
}
