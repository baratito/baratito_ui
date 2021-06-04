import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/view.dart';

class TextsView extends StatelessWidget {
  const TextsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.text;
    return View(
      title: 'Texts',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title', style: textTheme.title),
                Text('Headline 1', style: textTheme.headline1),
                Text('Headline 2', style: textTheme.headline2),
                Container(
                  color: context.theme.colors.greyBackground.withOpacity(.2),
                  child: Text(
                    'Input placeholder',
                    style: textTheme.inputPlaceholder,
                  ),
                ),
                Text('Body text', style: textTheme.body),
                Container(
                  color: context.theme.colors.primary,
                  child: Text('Primary button', style: textTheme.primaryButton),
                ),
                Text('Secondary button', style: textTheme.secondaryButton),
                Text('Dropdown button', style: textTheme.dropdown),
                Text('Label', style: textTheme.label),
                Text('Item title', style: textTheme.itemTitle),
                Text('Item subtitle 1', style: textTheme.itemSubtitle1),
                Text('Item subtitle 2', style: textTheme.itemSubtitle2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
