import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/widget_test_view.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'packages/baratito_ui/Poppins'),
        home: WidgetTestView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
