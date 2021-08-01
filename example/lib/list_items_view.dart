import 'package:flutter/material.dart';
import 'package:baratito_ui/baratito_ui.dart';

import 'package:example/view.dart';

class ListItemsView extends StatelessWidget {
  const ListItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      title: 'List',
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  children: [
                    IconSquircle(
                      icon: BaratitoIcons.category,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      NetworkImageSquircle(
                        imageUrl:
                            'https://imagenes.preciosclaros.gob.ar/productos/7793360000287.jpg',
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListItemBase(
                    title: 'Tomatitos en conserva aaaaaaaa a aaaaaaaaa',
                    subtitle1: 'Alimentos',
                    subtitle2: 'Desde \$230',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
