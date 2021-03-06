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
  Color get greenAccent => palette.greenDarkmode;

  @override
  Color get redAccent => palette.redDarkmode;

  @override
  Color get greyAccent => palette.offwhite;

  @override
  Color get greyBackground => palette.offwhite;

  @override
  Color get background => palette.greyscale1;

  @override
  Color get iconAction => palette.offwhite;

  @override
  Color get disabled => palette.greyscale2;

  @override
  Color get input => palette.greyscale2;

  @override
  Color get border => palette.greyscale4;

  @override
  Color get socialAuthFacebook => palette.facebookBlueDarkmode;

  @override
  Color get socialAuthGoogle => palette.googleOrangeDarkmode;

  @override
  Color get dragLine => palette.greyscale2;

  @override
  Color get aquamarineAccent => palette.aquamarineDarkmode;

  @override
  Color get blueAccent => palette.blueDarkmode;

  @override
  Color get brownAccent => palette.brownDarkmode;

  @override
  Color get lightblueAccent => palette.lightblueDarkmode;

  @override
  Color get lilacAccent => palette.lilacDarkmode;

  @override
  Color get mauveAccent => palette.mauveDarkmode;

  @override
  Color get orangeAccent => palette.orangeDarkmode;

  @override
  Color get pinkAccent => palette.pinkDarkmode;

  @override
  Color get salmonAccent => palette.salmonDarkmode;

  @override
  Color get spinner => palette.offwhite;
}
