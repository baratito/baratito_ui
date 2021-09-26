import 'dart:ui';

import 'package:baratito_ui/src/themes/color_theme.dart';
import 'package:baratito_ui/src/themes/baratito_palette.dart';

class LightColorTheme extends ColorTheme {
  LightColorTheme(BaratitoPalette palette) : super(palette);

  @override
  Color get primary => palette.purple;

  @override
  Color get cyanAccent => palette.cyan;

  @override
  Color get greenAccent => palette.green;

  @override
  Color get redAccent => palette.red;

  @override
  Color get greyAccent => palette.greyscale3;

  @override
  Color get greyBackground => palette.greyscale5;

  @override
  Color get background => palette.white;

  @override
  Color get iconAction => palette.greyscale1;

  @override
  Color get disabled => palette.greyscale5;

  @override
  Color get input => palette.greyscale6;

  @override
  Color get border => palette.greyscale5;

  @override
  Color get socialAuthFacebook => palette.facebookBlue;

  @override
  Color get socialAuthGoogle => palette.googleOrange;

  @override
  Color get dragLine => palette.greyscale5;

  @override
  Color get aquamarineAccent => palette.aquamarine;

  @override
  Color get blueAccent => palette.blue;

  @override
  Color get brownAccent => palette.brown;

  @override
  Color get lightblueAccent => palette.lightblue;

  @override
  Color get lilacAccent => palette.lilac;

  @override
  Color get mauveAccent => palette.mauve;

  @override
  Color get orangeAccent => palette.orange;

  @override
  Color get pinkAccent => palette.pink;

  @override
  Color get salmonAccent => palette.salmon;

  @override
  Color get spinner => palette.greyscale1;
}
