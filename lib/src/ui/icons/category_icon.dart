import 'package:baratito_ui/icons/baratito_icons.dart';
import 'package:baratito_ui/src/themes/theme_extension.dart';
import 'package:flutter/material.dart';

enum Category {
  frozenFood,
  personalCare,
  nonAlcoholicBeverages,
  alcoholicBeverages,
  babyProducts,
  petProducts,
  freshFood,
  cleaningProducts,
  groceryProducts,
}

class CategoryIcon extends StatelessWidget {
  final double? size;
  final Category category;

  const CategoryIcon({
    Key? key,
    required this.category,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconSize = size ?? context.theme.dimensions.iconRegular;
    late IconData icon;
    late Color color;

    switch (category) {
      case Category.frozenFood:
        icon = BaratitoIcons.snowflake;
        color = context.theme.colors.blueAccent;
        break;
      case Category.personalCare:
        icon = BaratitoIcons.toothbrush;
        color = context.theme.colors.lilacAccent;
        break;
      case Category.nonAlcoholicBeverages:
        icon = BaratitoIcons.bottle;
        color = context.theme.colors.aquamarineAccent;
        break;
      case Category.alcoholicBeverages:
        icon = BaratitoIcons.wine;
        color = context.theme.colors.mauveAccent;
        break;
      case Category.babyProducts:
        icon = BaratitoIcons.baby;
        color = context.theme.colors.pinkAccent;
        break;
      case Category.petProducts:
        icon = BaratitoIcons.treat;
        color = context.theme.colors.brownAccent;
        break;
      case Category.freshFood:
        icon = BaratitoIcons.steak;
        color = context.theme.colors.salmonAccent;
        break;
      case Category.cleaningProducts:
        icon = BaratitoIcons.bubbles;
        color = context.theme.colors.lightblueAccent;
        break;
      case Category.groceryProducts:
        icon = BaratitoIcons.can;
        color = context.theme.colors.orangeAccent;
    }

    return Icon(icon, size: iconSize, color: color);
  }
}
