import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/auth_provider.dart';
import 'package:recipe_app/screens/auth/login_screen.dart';
import 'package:recipe_app/widgets/bottomTabBar/fab_tabs.dart';
import 'package:recipe_app/widgets/custom_scaffold.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    switch (authProvider.status) {
      case AuthStatus.loading:
        return const CustomScaffold(
          child: Center(child: CircularProgressIndicator()),
        );
      case AuthStatus.authenticated:
        return const FabTabs();
      case AuthStatus.unauthenticated:
        return const LoginScreen();
    }
  }
}
