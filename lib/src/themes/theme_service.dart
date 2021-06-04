import 'package:baratito_ui/src/themes/baratito_palette.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:baratito_ui/src/themes/app_theme.dart';
import 'package:baratito_ui/src/themes/app_themes/dark_theme.dart';
import 'package:baratito_ui/src/themes/app_themes/light_theme.dart';

class ThemeService extends ChangeNotifier {
  final _themesKey = '__theme__';
  final SharedPreferences preferences;

  ThemeService(this.preferences);

  late AppTheme theme;

  void init() {
    AppTheme initialTheme = LightTheme(BaratitoPalette());

    if (preferences.containsKey(_themesKey)) {
      final name = preferences.getString(_themesKey);
      if (name == '$DarkTheme') {
        initialTheme = DarkTheme(BaratitoPalette());
      }
    }

    updateTheme(initialTheme);
  }

  void toggleTheme() {
    final newTheme = theme is DarkTheme
        ? LightTheme(BaratitoPalette())
        : DarkTheme(BaratitoPalette());
    saveTheme(newTheme);
    updateTheme(newTheme);
  }

  @protected
  void updateTheme(AppTheme newTheme) async {
    theme = newTheme;
    notifyListeners();
  }

  @protected
  void saveTheme(AppTheme theme) {
    final name = theme.runtimeType.toString();
    preferences.setString(_themesKey, name);
  }
}
