import 'package:baratito_ui/src/themes/baratito_palette.dart';
import 'package:baratito_ui/src/themes/color_theme.dart';
import 'package:baratito_ui/src/themes/shadow_theme.dart';
import 'package:baratito_ui/src/themes/dimension_theme.dart';
import 'package:baratito_ui/src/themes/text_theme.dart';

abstract class AppTheme {
  final BaratitoPalette palette;

  AppTheme(this.palette);

  ColorTheme get colors;
  TextTheme get text;
  ShadowTheme get shadows;
  DimensionTheme get dimensions;
}

abstract class LightTheme extends AppTheme {
  LightTheme(BaratitoPalette palette) : super(palette);
}

abstract class DarkTheme extends AppTheme {
  DarkTheme(BaratitoPalette palette) : super(palette);
}
