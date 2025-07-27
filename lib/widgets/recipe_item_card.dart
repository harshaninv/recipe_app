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
      color: Colors.transparent,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: onTapRecipe,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorScheme.of(context).secondary.withAlpha(150),
          ),
          child: Stack(
            children: [
              Hero(
                tag: recipe.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(recipe.image),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: const Color.fromARGB(166, 53, 5, 27),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        recipe.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
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
      ),
    );
  }
}
