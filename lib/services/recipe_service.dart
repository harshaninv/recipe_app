import 'dart:convert';

import 'package:recipe_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  final String _baseUrl = 'https://dummyjson.com/recipes';

  Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> recipeList = data['recipes'];

        return recipeList.map((json) => Recipe.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data recipes');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
