import 'package:flutter/material.dart';

extension ScreenDimensionsExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  EdgeInsets get screenPadding => MediaQuery.of(this).padding;
}
