import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import 'package:training_example/views/cart/cart_page.dart';
import 'package:training_example/views/general_page/general_page.dart';
import 'package:training_example/views/home/home_page.dart';
import 'package:training_example/views/search/search_page.dart';
import 'package:training_example/views/setting/setting_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => GeneralPage(child: child),
          routes: [
            GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage()),
            GoRoute(
                path: '/contact',
                builder: (context, state) => const CartPage()),
            GoRoute(
                path: '/search',
                builder: (context, state) => const SearchPage()),
            GoRoute(
                path: '/setting',
                builder: (context, state) => const SettingPage()),
          ]),
    ]);
