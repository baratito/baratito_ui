import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/view.dart';

class ButtonsView extends StatelessWidget {
  const ButtonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      title: 'Buttons',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
