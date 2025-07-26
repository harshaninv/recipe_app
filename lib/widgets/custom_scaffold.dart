import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child, this.appBar, this.drawer, this.bottomNavigateionBar});

  final Widget child;
  final AppBar? appBar;
  final Drawer? drawer;
  final BottomAppBar? bottomNavigateionBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigateionBar,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background_image.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child
          ),
        ],
      ),
    );
  }
}
