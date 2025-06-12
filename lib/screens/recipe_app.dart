import 'package:flutter/material.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/screens/meals_list.dart';

class RecipeAppScreen extends StatelessWidget {
  const RecipeAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Scaffold(
        body: MealsList(),
      ),
    );
  }
}