import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final Widget child;

  const MainPage({required this.child, super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        goToPage(targetIndex: 0);
        break;
      case 1:
        GoRouter.of(context).go('/contact');
        goToPage(targetIndex: 1);
        break;
      case 2:
        GoRouter.of(context).go('/search');
        goToPage(targetIndex: 2);
        break;
      case 3:
        GoRouter.of(context).go('/setting');
        goToPage(targetIndex: 3);
        break;
    }
  }

  void goToPage({required int targetIndex}) {
    if (currentIndex != targetIndex) {
      setState(() {
        currentIndex = targetIndex;
      });
    }
  }
}
