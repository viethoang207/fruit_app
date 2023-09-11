import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/features/cart/presentation/cart_page.dart';
import 'package:training_example/features/home/presentation/home_page.dart';
import 'package:training_example/features/search/presentation/search_page.dart';
import 'package:training_example/features/setting/presentation/setting_page.dart';

import '../../translations/locale_keys.g.dart';
import '../home/widgets/icon_with_number_widget.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => GeneralPageState();
}

class GeneralPageState extends State<GeneralPage> {
  late int _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;
  int cartItems = 0;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = const [HomePage(), CartPage(), SearchPage(), SettingPage()];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded, size: 30),
              label: LocaleKeys.home.tr(),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
          BottomNavigationBarItem(
              icon: const BadgeIcon(
                  amount: 5, icon: Icon(Icons.shopping_cart_outlined)),
              label: LocaleKeys.cart.tr(),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search_rounded, size: 30),
              label: LocaleKeys.search.tr(),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person, size: 30),
              label: LocaleKeys.settings.tr(),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
        ],
        currentIndex: _selectedPageIndex,
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.jumpToPage(_selectedPageIndex);
    });
  }
}
