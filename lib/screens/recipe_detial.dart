import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/theme/app_text_theme.dart';
import 'package:recipe_app/theme/color_theme.dart';
import 'package:recipe_app/widgets/ingredients_list.dart';
import 'package:recipe_app/widgets/instroctions_list.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeDetialScreen extends StatelessWidget {
  const RecipeDetialScreen({super.key, required this.recipedetail});

  final Recipe recipedetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipedetail.name), 
        centerTitle: true,
        titleTextStyle: AppTextTheme.textTheme.headlineLarge!.copyWith(
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: recipedetail.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(recipedetail.image),
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorTheme.hotPink, ColorTheme.mediumPink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Ingredients...',
                    style: AppTextTheme.textTheme.headlineLarge!.copyWith(
                      color: const Color.fromARGB(255, 49, 11, 28),
                      fontSize: 24,
                    ),
                  ),
                  IngredientsList(ingredients: recipedetail.ingredients),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'How to make...',
              style: AppTextTheme.textTheme.headlineLarge!.copyWith(
                fontSize: 24,
              ),
            ),
            InstroctionsList(instructions: recipedetail.instructions),
          ],
        ),
      ),
    );
  }
}
