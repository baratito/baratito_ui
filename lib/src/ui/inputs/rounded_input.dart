import 'package:baratito_ui/icons/baratito_icons.dart';
import 'package:baratito_ui/src/ui/animations/animations.dart';
import 'package:baratito_ui/src/ui/buttons/icon_action_button.dart';
import 'package:flutter/material.dart';

import 'package:baratito_ui/src/themes/theme_extension.dart';

enum RoundedInputType { regular, large }

typedef OnValueChanged = void Function(String);

class RoundedInput extends StatelessWidget {
  final String? placeholder;
  final Widget? leading;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final bool? autofocus;
  final OnValueChanged? onValueChanged;
  final RoundedInputType _type;

  const RoundedInput({
    Key? key,
    this.placeholder,
    this.leading,
    this.inputType,
    this.controller,
    this.autofocus,
    this.onValueChanged,
  })  : _type = RoundedInputType.regular,
        super(key: key);

  const RoundedInput.large({
    Key? key,
    this.placeholder,
    this.leading,
    this.inputType,
    this.controller,
    this.autofocus,
    this.onValueChanged,
  })  : _type = RoundedInputType.large,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _RoundedInput(
      placeholder: placeholder,
      leading: leading,
      inputType: inputType,
      controller: controller,
      autofocus: autofocus,
      onValueChanged: onValueChanged,
      type: _type,
    );
  }
}

class _RoundedInput extends StatefulWidget {
  final String? placeholder;
  final Widget? leading;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final bool? autofocus;
  final OnValueChanged? onValueChanged;
  final RoundedInputType type;

  const _RoundedInput({
    Key? key,
    this.placeholder,
    this.leading,
    this.inputType,
    this.controller,
    this.autofocus,
    this.onValueChanged,
    this.type = RoundedInputType.regular,
  }) : super(key: key);

  @override
  _RoundedInputState createState() => _RoundedInputState();
}

class _RoundedInputState extends State<_RoundedInput>
    with SingleTickerProviderStateMixin {
  final _focusNode = FocusNode();
  late TextEditingController _controller;

  late AnimationController _clearButtonFadeController;
  late Animation<double> _clearButtonFadeAnimation;
  final _cleaButtonFadeAnimationDuration = const Duration(milliseconds: 300);

  bool _hasFocus = false;
  late String _lastInputValue;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _lastInputValue = widget.controller?.text ?? '';
    _clearButtonFadeController = AnimationController(
      vsync: this,
      duration: _cleaButtonFadeAnimationDuration,
    );
    _clearButtonFadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _clearButtonFadeController, curve: Curves.ease),
    );
    _focusNode.addListener(_onFocus);
    _controller.addListener(_onValueChanged);
    super.initState();
  }

  void _onFocus() {
    final hasFocus = _focusNode.hasFocus;
    if (hasFocus == _hasFocus) return;
    setState(() => _hasFocus = hasFocus);
  }

  void _onValueChanged() {
    if (_controller.text != _lastInputValue) {
      _lastInputValue = _controller.text;
      final hasText = _controller.text.isNotEmpty;
      if (hasText) {
        if (!_clearButtonFadeController.isCompleted) {
          _clearButtonFadeController.forward();
        }
      } else {
        _clearButtonFadeController.reverse();
      }
      if (widget.onValueChanged != null) {
        widget.onValueChanged!(_controller.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusedColor = context.theme.colors.background;
    final blurredColor = context.theme.colors.input;
    final backgroundColor = _hasFocus ? focusedColor : blurredColor;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: _buildBorder(context),
      ),
      child: _buildInput(context),
    );
  }

  Border _buildBorder(BuildContext context) {
    final focusedColor = context.theme.text.body.color!;
    final blurredColor = context.theme.colors.input;
    final color = _hasFocus ? focusedColor : blurredColor;
    return Border.all(
      color: color,
      width: 2,
    );
  }

  Widget _buildInput(BuildContext context) {
    final isLarge = widget.type == RoundedInputType.large;
    final bodyTextStyle = context.theme.text.body.copyWith(
      fontSize: isLarge
          ? context.theme.text.body.fontSize! + 1
          : context.theme.text.body.fontSize,
    );
    final placeholderTextStyle = context.theme.text.inputPlaceholder.copyWith(
      fontSize: isLarge
          ? context.theme.text.inputPlaceholder.fontSize! + 1
          : context.theme.text.inputPlaceholder.fontSize,
    );
    return Row(
      children: [
        if (widget.leading != null) widget.leading!,
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            // onChanged: _onInputChange,
            autofocus: widget.autofocus ?? false,
            keyboardType: widget.inputType,
            style: bodyTextStyle,
            cursorColor: bodyTextStyle.color!,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: placeholderTextStyle,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: isLarge ? 22 : 16,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: _buildClearButton(context),
        ),
      ],
    );
  }

  // void _onInputChange(String value) {
  //   if (_lastInputValue != value) {
  //     _lastInputValue = value;
  //     if (widget.onValueChanged != null) {
  //       widget.onValueChanged!(value);
  //     }
  //   }
  // }

  Widget _buildClearButton(BuildContext context) {
    final isRegular = widget.type == RoundedInputType.regular;
    final iconSize = isRegular ? context.theme.dimensions.iconRegular : null;
    return AnimatedBuilder(
      animation: _clearButtonFadeController,
      builder: (_, child) {
        return AnimatedVisibility(
          animation: _clearButtonFadeAnimation,
          child: child!,
        );
      },
      child: IconActionButton(
        icon: BaratitoIcons.close,
        iconSize: iconSize,
        onTap: () => _controller.clear(),
      ),
    );
  }
}
