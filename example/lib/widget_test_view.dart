import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/list_items_view.dart';
import 'package:example/inputs_view.dart';
import 'package:example/texts_view.dart';
import 'package:example/branding_view.dart';
import 'package:example/buttons_view.dart';
import 'package:example/view.dart';

class WidgetTestView extends StatelessWidget {
  const WidgetTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(child: _buildWidgetList(context));
  }

  Widget _buildWidgetList(BuildContext context) {
    return ListView(
      children: [
        _buildItem(context, 'Texts', TextsView()),
        _buildItem(context, 'Branding', BrandingView()),
        _buildItem(context, 'Buttons', ButtonsView()),
        _buildItem(context, 'Inputs', InputsView()),
        _buildItem(context, 'List', ListItemsView()),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String title, Widget navigateTo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            title,
            style: context.theme.text.itemTitle,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => navigateTo),
            );
          },
        ),
        Divider(color: context.theme.colors.greyBackground),
      ],
    );
  }
}
