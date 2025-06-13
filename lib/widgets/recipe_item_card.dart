import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeItemCard extends StatelessWidget {
  const RecipeItemCard({
    super.key,
    required this.recipe,
    required this.onTapRecipe,
  });

  final Recipe recipe;
  final void Function() onTapRecipe;

  @override
  Widget build(BuildContext context) {
    int totalCookTime = recipe.cookTimeMinutes + recipe.prepTimeMinutes;

    return Card(
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: onTapRecipe,
        child: Stack(
          children: [
            Hero(
              tag: recipe.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(recipe.image),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(162, 80, 71, 75),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.only(left: 80, bottom: 15),
                child: Column(
                  children: [
                    Text(
                      recipe.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RecipeItemTrait(
                          icon: Icons.timer,
                          label: '$totalCookTime min',
                        ),
                        const SizedBox(height: 5),
                        RecipeItemTrait(
                          icon: Icons.mood_rounded,
                          label: recipe.difficulty,
                        ),
                        const SizedBox(height: 5),
                        RecipeItemTrait(
                          icon: Icons.local_dining_outlined,
                          label: '${recipe.servings}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
