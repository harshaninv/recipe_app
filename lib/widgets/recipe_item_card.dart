import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeItemCard extends StatelessWidget {
  const RecipeItemCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        // onTap: onTapMeal,
        child: Stack(
          children: [
            Hero(
              tag: recipe.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(recipe.image),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      recipe.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RecipeItemTrait(
                          icon: Icons.timer,
                          label: '${recipe.cookTimeMinutes} min',
                        ),
                        const SizedBox(width: 20),
                        RecipeItemTrait(
                          icon: Icons.mood_rounded,
                          label: recipe.difficulty,
                        ),
                        const SizedBox(width: 20),
                        RecipeItemTrait(
                          icon: Icons.attach_money,
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
