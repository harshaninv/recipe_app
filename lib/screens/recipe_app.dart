import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/providers/auth_provider.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/screens/auth/login_screen.dart';
import 'package:recipe_app/screens/auth/signup_screen.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/widgets/auth_wrapper.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Recipe Book',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: const AuthWrapper(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}