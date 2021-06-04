import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/view.dart';

class BrandingView extends StatelessWidget {
  const BrandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      title: 'Branding',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaratitoIsotype(size: 80),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: BaratitoLogotype(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
