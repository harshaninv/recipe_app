import 'package:flutter/material.dart';
import 'package:recipe_app/screens/recipe_app.dart';
import 'package:recipe_app/theme/color_theme.dart';
import 'package:recipe_app/theme/app_text_theme.dart';


final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: ColorTheme.hotPink,
    secondary: ColorTheme.mediumPink,
    surface: ColorTheme.darkBrown,
    onPrimary: Colors.white,
    onSurface: ColorTheme.lightPink,
    onSecondary: Colors.black,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 58, 8, 30),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 134, 24, 62),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorTheme.hotPink,
      foregroundColor: Colors.white,
    ),
  ),
  textTheme: AppTextTheme.textTheme,
);

void main() {
  runApp(const RecipeApp());
}
