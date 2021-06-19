import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:baratito_ui/src/themes/app_theme.dart';
import 'package:baratito_ui/src/themes/app_themes/app_themes.dart';
import 'package:baratito_ui/src/themes/baratito_palette.dart';

class ThemeResolver {
  final _palette = BaratitoPalette();

  String get darkThemeKey => 'DarkTheme';

  String get lightThemeKey => 'LightTheme';

  DarkTheme getDarkTheme() {
    // TODO: make web dark theme
    if (kIsWeb) return MobileDarkTheme(_palette);
    return MobileDarkTheme(_palette);
  }

  LightTheme getLightTheme() {
    // TODO: make web light theme
    if (kIsWeb) return MobileLightTheme(_palette);
    return MobileLightTheme(_palette);
  }
}
