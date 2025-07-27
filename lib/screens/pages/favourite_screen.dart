import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/custom_scaffold.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      child: Center(
        child: Text(
          'My Favourite Recipes',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),// Assuming you have a Drawer widget to use
    );
  }
}