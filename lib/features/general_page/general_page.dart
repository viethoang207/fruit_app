import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_example/di/injection.dart';
import 'package:training_example/features/cart/cart_page.dart';
import 'package:training_example/features/home/presentation/home_page.dart';
import 'package:training_example/features/search/search_page.dart';
import 'package:training_example/features/setting/setting_page.dart';
import 'package:training_example/models/user_info/bloc/user_info_bloc.dart';

import '../home/widgets/icon_with_number_widget.dart';

class GeneralPage extends StatefulWidget {
  final Widget child;

  const GeneralPage({required this.child, super.key});

  @override
  State<GeneralPage> createState() => GeneralPageState();
}

class GeneralPageState extends State<GeneralPage>{

  late int _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = const [
      HomePage(),
      CartPage(),
      SearchPage(),
      SettingPage()
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<UserInfoBloc>(),
        )
      ],
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _pages
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, size: 30),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 255, 255, 255)
            ),
            BottomNavigationBarItem(
              icon: BadgeIcon(amount: 5, icon: Icon(Icons.shopping_cart_outlined)),
              label: 'Cart',
                backgroundColor: Color.fromARGB(255, 255, 255, 255)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded, size: 30),
              label: 'Search',
                backgroundColor: Color.fromARGB(255, 255, 255, 255)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Settings',
                backgroundColor: Color.fromARGB(255, 255, 255, 255)
            ),
          ],
          currentIndex: _selectedPageIndex,
          onTap: (int idx) => _onItemTapped(idx, context),
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/cart')) {
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
    setState(() {
      _selectedPageIndex = index;
      _pageController.jumpToPage(_selectedPageIndex);
    });
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/cart');
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
