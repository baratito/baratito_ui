import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:baratito_ui/src/themes/theme_service.dart';

class ThemeProvider extends StatelessWidget {
  final Widget child;

  ThemeProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) return BlankScreen();
        final preferences = snapshot.data!;
        final service = ThemeService(preferences);
        service.init();

        return ChangeNotifierProvider<ThemeService>.value(
          value: service,
          child: child,
        );
      },
    );
  }
}

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}
