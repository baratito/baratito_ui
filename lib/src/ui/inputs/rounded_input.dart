import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

enum RoundedInputType { regular, large }

class RoundedInput extends StatelessWidget {
  final String? placeholder;
  final Widget? leading;
  final TextInputType? inputType;
  final RoundedInputType _type;

  const RoundedInput({
    Key? key,
    this.placeholder,
    this.leading,
    this.inputType,
  })  : _type = RoundedInputType.regular,
        super(key: key);

  const RoundedInput.large({
    Key? key,
    this.placeholder,
    this.leading,
    this.inputType,
  })  : _type = RoundedInputType.large,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _RoundedInput(
      placeholder: placeholder,
      leading: leading,
      inputType: inputType,
      type: _type,
    );
  }
}

class _RoundedInput extends StatelessWidget {
  final String? placeholder;
  final Widget? leading;
  final TextInputType? inputType;
  final RoundedInputType type;

  const _RoundedInput({
    Key? key,
    this.placeholder,
    this.leading,
    this.inputType,
    this.type = RoundedInputType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colors.input,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildInput(context),
    );
  }

  Widget _buildInput(BuildContext context) {
    final isLarge = type == RoundedInputType.large;
    return Row(
      children: [
        if (leading != null)
          leading!,
        Expanded(
          child: TextField(
            keyboardType: inputType,
            style: context.theme.text.body,
            cursorColor: context.theme.text.body.color!,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: context.theme.text.inputPlaceholder,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: isLarge ? 24 : 16,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
