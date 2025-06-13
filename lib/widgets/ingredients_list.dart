import 'package:flutter/material.dart';
import 'package:recipe_app/theme/app_text_theme.dart';

class IngredientsList extends StatefulWidget {
  const IngredientsList({super.key, required this.ingredients});

  final List<String> ingredients;

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  late List<bool> _checkedIngredients;

  @override
  void initState() {
    _checkedIngredients = List<bool>.filled(widget.ingredients.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.ingredients.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // return Text(ingredients[index]);
        return CheckboxListTile(
          value: _checkedIngredients[index],
          onChanged: (value) {
            setState(() {
              _checkedIngredients[index] = value!;
            });
          },
          title: Text(widget.ingredients[index], style: AppTextTheme.textTheme.headlineLarge!.copyWith(
            color: const Color.fromARGB(255, 49, 11, 28),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          activeColor:  const Color.fromARGB(255, 49, 11, 28),
        );
      },
    );
  }
}
