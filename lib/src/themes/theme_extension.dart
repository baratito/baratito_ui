import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:baratito_ui/src/themes/app_theme.dart';
import 'package:baratito_ui/src/themes/theme_service.dart';

extension ThemeExtension on BuildContext {

  AppTheme get theme => Provider.of<ThemeService>(this).theme;

  ThemeService get themeService {
    return Provider.of<ThemeService>(this, listen: false);
  }

  AppTheme get themeValue {
    return themeService.theme;
  }

  bool get isDarkmodeActive => theme is DarkTheme;
}
