import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/view.dart';

class InputsView extends StatelessWidget {
  const InputsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      title: 'Inputs',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedInput(
              placeholder: 'Agregar un alias...',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RoundedInput(
                placeholder: 'Agregar un alias...',
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: context.theme.text.body.color!,
                      strokeWidth: 2,
                    )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RoundedInput.large(
                placeholder: 'Agregar un alias...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
