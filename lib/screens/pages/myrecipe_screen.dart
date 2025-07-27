import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/custom_scaffold.dart';

class MyrecipeScreen extends StatelessWidget {
  const MyrecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: const Text('Favourites')),
      child: Center(
        child: Text(
          'My Recipes',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ), // Assuming you have a Drawer widget to use
    );
  }
}
