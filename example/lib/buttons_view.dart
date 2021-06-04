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
                PrimaryButton.extended(label: 'Completar compra'),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: PrimaryButton(
                    icon: BaratitoIcons.plus,
                    label: 'Creá una lista',
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
