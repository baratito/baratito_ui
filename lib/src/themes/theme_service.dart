import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:baratito_ui/src/themes/app_theme.dart';
import 'package:baratito_ui/src/themes/theme_resolver.dart';

class ThemeService extends ChangeNotifier {
  final _themesKey = '__theme__';
  final _themeResolver = ThemeResolver();

  final SharedPreferences preferences;

  ThemeService(this.preferences);

  late AppTheme theme;

  void init() {
    AppTheme initialTheme = _themeResolver.getLightTheme();

    if (preferences.containsKey(_themesKey)) {
      final name = preferences.getString(_themesKey);
      if (name == _themeResolver.darkThemeKey) {
        initialTheme = _themeResolver.getDarkTheme();
      }
    }

    updateTheme(initialTheme);
  }

  void toggleTheme() {
    final newTheme = theme is LightTheme
        ? _themeResolver.getLightTheme()
        : _themeResolver.getDarkTheme();
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
    final key = theme is LightTheme
        ? _themeResolver.lightThemeKey
        : _themeResolver.darkThemeKey;
    preferences.setString(_themesKey, key);
  }
}
