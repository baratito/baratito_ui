import 'package:baratito_ui/src/themes/baratito_palette.dart';
import 'package:baratito_ui/src/themes/text_theme.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/widgets.dart';

class LightTextTheme extends TextTheme {
  LightTextTheme(BaratitoPalette palette) : super(palette);

  @override
  TextStyle get body => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: palette.greyscale2,
        letterSpacing: .75,
      );

  @override
  TextStyle get dropdown => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: palette.greyscale1,
        letterSpacing: .25,
      );

  @override
  TextStyle get headline1 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: palette.greyscale1,
        letterSpacing: .75,
      );

  @override
  TextStyle get headline2 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: palette.greyscale4,
        letterSpacing: .75,
      );

  @override
  TextStyle get inputPlaceholder => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: palette.greyscale4,
        letterSpacing: .75,
      );

  @override
  TextStyle get itemSubtitle1 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: palette.greyscale3,
        letterSpacing: .25,
      );

  @override
  TextStyle get itemSubtitle2 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: palette.greyscale3,
        letterSpacing: .25,
      );

  @override
  TextStyle get itemTitle => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: palette.greyscale1,
        letterSpacing: .75,
      );

  @override
  TextStyle get label => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: palette.greyscale3,
        letterSpacing: .25,
      );

  @override
  TextStyle get primaryButton => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: palette.offwhite,
        letterSpacing: .25,
      );

  @override
  TextStyle get secondaryButton => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: palette.purple,
        letterSpacing: .25,
      );

  @override
  TextStyle get title => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: palette.greyscale1,
        letterSpacing: 1,
      );
}
