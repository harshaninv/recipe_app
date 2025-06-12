import 'package:flutter/material.dart';

class RecipeItemTrait extends StatelessWidget {
  const RecipeItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon),
      const SizedBox(width: 10,),
      Text(label),
    ]);
  }
}
