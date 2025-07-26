import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/auth_provider.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/screens/recipe_detial.dart';
import 'package:recipe_app/widgets/app_drawer.dart';
import 'package:recipe_app/widgets/custom_scaffold.dart';
import 'package:recipe_app/widgets/recipe_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final recipeProvider = Provider.of<RecipeProvider>(
        context,
        listen: false,
      );
      if (recipeProvider.recipes.isEmpty) {
        recipeProvider.loadRecipes();
      }
    });

    super.initState();
  }

  void _selectMeal(BuildContext context, Recipe recipe) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RecipeDetialScreen(recipedetail: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final List<Recipe> listOfRecipes = recipeProvider.recipes;

    return CustomScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Food Recipes'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headlineLarge,
        actions: [
          Builder(
            builder: (ctx) => IconButton(
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          ),
        ],
      ),
      drawer: const Drawer(child: RecipeAppDrawer()),
      child: recipeProvider.isLoading
          ? const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: listOfRecipes.length,
                itemBuilder: (context, index) {
                  return RecipeItemCard(
                    recipe: listOfRecipes[index],
                    onTapRecipe: () =>
                        _selectMeal(context, listOfRecipes[index]),
                  );
                },
              ),
            ),
    );
  }
}
