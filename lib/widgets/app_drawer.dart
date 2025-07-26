// recipe_app_drawer.dart or same file

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/auth_provider.dart';

class RecipeAppDrawer extends StatelessWidget {
  const RecipeAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Column(
            children: [
              Text(
                'Recipe App',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: const Color.fromARGB(206, 58, 8, 30),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://avatar.iran.liara.run/public/boy?username=Ash&size=64",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: FutureBuilder<Map<String, dynamic>>(
                      future: Provider.of<AuthProvider>(context, listen: false).getUserProfile(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text('Error');
                        } else if (snapshot.hasData) {
                          final username = snapshot.data?['username'] ?? 'User';
                          final email = snapshot.data?['email'] ?? 'Email';
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                username,
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                email,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  color: Colors.white70,
                                  fontSize: 24
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Text('User');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Provider.of<AuthProvider>(context, listen: false).logout();
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
