import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_example/views/home/icon_with_number_widget.dart';

class GeneralPage extends StatefulWidget {
  final Widget child;

  const GeneralPage({required this.child, super.key});

  @override
  State<GeneralPage> createState() => _GeneralPage();
}

class _GeneralPage extends State<GeneralPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BadgeIcon(amount: 5, icon: Icon(Icons.shopping_cart_outlined)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, size: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Settings',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/contact')) {
      return 1;
    }
    if (location.startsWith('/search')) {
      return 2;
    }
    if (location.startsWith('/setting')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/contact');
        break;
      case 2:
        GoRouter.of(context).go('/search');
        break;
      case 3:
        GoRouter.of(context).go('/setting');
        break;
    }
  }
}
