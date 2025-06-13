import 'package:flutter/material.dart';
import 'package:recipe_app/theme/app_text_theme.dart';
import 'package:recipe_app/theme/color_theme.dart';

class RecipeItemTrait extends StatelessWidget {
  const RecipeItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(label, style: AppTextTheme.textTheme.bodyLarge, ),
      Icon(icon, color: ColorTheme.lightPink, size: 16,),
    ]);
  }
}
