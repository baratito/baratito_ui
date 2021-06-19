import 'package:baratito_ui/baratito_ui.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/ui/inputs/rounded_input.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';

class SearchBox extends StatelessWidget {
  final String? placeholder;
  final bool? autofocus;

  const SearchBox({
    Key? key,
    this.placeholder,
    this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedInput.large(
      placeholder: placeholder,
      leading: _buildSearchIcon(context),
      autofocus: autofocus,
    );
  }

  Widget _buildSearchIcon(BuildContext context) {
    final iconColor = context.theme.text.body.color!;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Icon(
        BaratitoIcons.search,
        color: iconColor,
        size: context.theme.dimensions.actionIconLarge,
      ),
    );
  }
}
