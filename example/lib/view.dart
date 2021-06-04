import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

class View extends StatelessWidget {
  final Widget child;
  final String? title;

  const View({Key? key, required this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colors.background,
        iconTheme: IconThemeData(
          color: context.theme.text.headline1.color,
        ),
        title: _buildTitle(context),
        actions: [
          _buildSwitch(context),
        ],
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: context.theme.colors.background,
        child: child,
      ),
    );
  }

  Widget _buildSwitch(BuildContext context) {
    return Switch(
      value: context.isDarkmodeActive,
      onChanged: (_) => context.themeService.toggleTheme(),
    );
  }

  Widget? _buildTitle(BuildContext context) {
    if (title == null) return null;
    return Text(
      title!,
      style: context.theme.text.headline1,
    );
  }
}
