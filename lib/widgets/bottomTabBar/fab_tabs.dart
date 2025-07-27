import 'package:flutter/material.dart';
import 'package:recipe_app/screens/pages/chat_screen.dart';
import 'package:recipe_app/screens/pages/favourite_screen.dart';
import 'package:recipe_app/screens/pages/home_screen.dart';
import 'package:recipe_app/screens/pages/myrecipe_screen.dart';

class FabTabs extends StatefulWidget {
  const FabTabs({super.key});

  @override
  State<FabTabs> createState() => _FabTabsState();
}

class _FabTabsState extends State<FabTabs> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavouriteScreen(),
    ChatScreen(),
    MyrecipeScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 147, 18, 38),
      body: PageStorage(bucket: bucket, child: _pages[currentIndex]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorScheme.of(context).primary,
        onPressed: () {
          // Handle FAB action here
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: ColorScheme.of(context).primary,
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color:
                            currentIndex == 0
                                ? ColorScheme.of(context).onSecondary
                                : ColorScheme.of(context).secondary,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color:
                            currentIndex == 1
                                ? ColorScheme.of(context).onSecondary
                                : ColorScheme.of(context).secondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.messenger_rounded,
                        color:
                            currentIndex == 2
                                ? ColorScheme.of(context).onSecondary
                                : ColorScheme.of(context).secondary,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fastfood_rounded,
                        color:
                            currentIndex == 3
                                ? ColorScheme.of(context).onSecondary
                                : ColorScheme.of(context).secondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
