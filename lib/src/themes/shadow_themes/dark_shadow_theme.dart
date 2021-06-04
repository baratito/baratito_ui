import 'package:flutter/widgets.dart';

import 'package:baratito_ui/src/themes/baratito_palette.dart';
import 'package:baratito_ui/src/themes/shadow_theme.dart';

class DarkShadowTheme extends ShadowTheme {
  DarkShadowTheme(BaratitoPalette palette) : super(palette);

  @override
  BoxShadow get large => BoxShadow(
        blurRadius: 64,
        color: palette.purpleDarkmode.withOpacity(.1),
      );

  @override
  BoxShadow get small => BoxShadow(
        blurRadius: 16,
        offset: Offset(0, 8),
        color: palette.purpleDarkmode.withOpacity(.2),
      );
}
