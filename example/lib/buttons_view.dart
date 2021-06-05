import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/view.dart';

class ButtonsView extends StatefulWidget {
  const ButtonsView({Key? key}) : super(key: key);

  @override
  _ButtonsViewState createState() => _ButtonsViewState();
}

class _ButtonsViewState extends State<ButtonsView> {
  bool showNotificationIndicator = true;

  @override
  Widget build(BuildContext context) {
    return View(
      title: 'Buttons',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Row(
                children: [_buildContent(context)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryButton.extended(
          label: 'Completar compra',
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: PrimaryButton(
            onTap: () {},
            icon: BaratitoIcons.plus,
            label: 'Creá una lista',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: PrimaryButton(
            icon: BaratitoIcons.plus,
            label: 'Creá una lista',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SecondaryButton(
            onTap: () {},
            label: 'Cancelar',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SecondaryButton.extended(
            onTap: () {},
            label: 'Cerrar ventana',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SecondaryButton(
            label: 'Cancelar',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SelectionButton(
            onTap: () {},
            label: 'Casa',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SelectionButton(
            label: 'Trabajo',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: IconActionButton(
            onTap: () {},
            icon: BaratitoIcons.editSquare,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: IconActionButton(
            icon: BaratitoIcons.editSquare,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: NotificationsButton(
            onTap: () => setState(() {
              showNotificationIndicator = !showNotificationIndicator;
            }),
            showIndicator: showNotificationIndicator,
          ),
        ),
      ],
    );
  }
}
