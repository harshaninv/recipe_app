import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/widgets/recipe_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
      if (recipeProvider.recipes.isEmpty) {
        recipeProvider.loadRecipes();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final List<Recipe> listOfRecipes = recipeProvider.recipes;

    return Scaffold(
      appBar: AppBar(title: const Text('Food Recipes')),
      body: recipeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: listOfRecipes.length,
              itemBuilder: (context, index) {
                return RecipeItemCard(recipe: listOfRecipes[index]);
              },
            ),
    );
  }
}
