import 'package:baratito_ui/src/themes/app_theme.dart';
import 'package:baratito_ui/src/themes/baratito_palette.dart';
import 'package:baratito_ui/src/themes/color_theme.dart';
import 'package:baratito_ui/src/themes/color_themes/color_themes.dart';
import 'package:baratito_ui/src/themes/shadow_theme.dart';
import 'package:baratito_ui/src/themes/shadow_themes/shadow_themes.dart';
import 'package:baratito_ui/src/themes/text_theme.dart';
import 'package:baratito_ui/src/themes/text_themes/text_themes.dart';

class DarkTheme extends AppTheme {
  DarkTheme(BaratitoPalette palette) : super(palette);

  @override
  ColorTheme get colors => DarkColorTheme(palette);

  @override
  TextTheme get text => DarkTextTheme(palette);

  @override
  ShadowTheme get shadows => DarkShadowTheme(palette);
}
