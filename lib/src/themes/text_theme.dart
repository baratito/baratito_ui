import 'package:flutter/widgets.dart';

import 'package:baratito_ui/src/themes/baratito_palette.dart';

abstract class TextTheme {
  @protected
  final BaratitoPalette palette;

  TextTheme(this.palette);

  TextStyle get title;

  TextStyle get headline1;
  TextStyle get headline2;
  TextStyle get inputPlaceholder;

  TextStyle get body;

  TextStyle get label;

  TextStyle get itemTitle;
  TextStyle get itemSubtitle1;
  TextStyle get itemSubtitle2;

  TextStyle get primaryButton;
  TextStyle get secondaryButton;
  TextStyle get dropdown;
}
