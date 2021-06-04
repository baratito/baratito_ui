import 'dart:ui';

import 'package:baratito_ui/src/themes/color_theme.dart';
import 'package:baratito_ui/src/themes/baratito_palette.dart';

class DarkColorTheme extends ColorTheme {
  DarkColorTheme(BaratitoPalette palette) : super(palette);

  @override
  Color get primary => palette.purpleDarkmode;

  @override
  Color get cyanAccent => palette.cyanDarkmode;

  @override
  Color get greenAccent => palette.cyanDarkmode;

  @override
  Color get redAccent => palette.cyanDarkmode;

  @override
  Color get greyAccent => palette.offwhite;

  @override
  Color get greyBackground => palette.offwhite;

  @override
  Color get background => palette.greyscale1;

  @override
  Color get iconAction => palette.offwhite;
}
