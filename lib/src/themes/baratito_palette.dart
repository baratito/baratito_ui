import 'package:flutter/widgets.dart';

class BaratitoPalette {
  static final BaratitoPalette _instance = BaratitoPalette._();
  factory BaratitoPalette() => _instance;

  BaratitoPalette._();

  final purple = Color(0xFF5F2EEA);
  final purpleDarkmode = Color(0xFFBCA4FF);
  final purpleLight = Color(0xFFE4DAFF);

  final cyan = Color(0xFF1CC8EE);
  final cyanDarkmode = Color(0xFF82E9FF);

  final red = Color(0xFFED2E7E);
  final redDarkmode = Color(0xFFFF84B7);

  final green = Color(0xFF00BA88);
  final greenDarkmode = Color(0xFF34EAB9);

  final greyscale1 = Color(0xFF14142B);
  final greyscale2 = Color(0xFF4E4B66);
  final greyscale3 = Color(0xFF6E7191);
  final greyscale4 = Color(0xFFA0A3BD);
  final greyscale5 = Color(0xFFD9DBE9);
  final greyscale6 = Color(0xFFEFF0F6);

  final offwhite = Color(0xFFFCFCFC);
  final white = Color(0xFFFFFFFF);
}
