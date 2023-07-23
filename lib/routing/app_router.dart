import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import 'package:training_example/features/contact/contact_page.dart';
import 'package:training_example/features/home/home_page.dart';
import 'package:training_example/features/main_page/main_page.dart';
import 'package:training_example/features/search/search_page.dart';
import 'package:training_example/features/setting/setting_page.dart';

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
          builder: (context, state, child) => MainPage(child: child),
          routes: [
            GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage()),
            GoRoute(
                path: '/contact',
                builder: (context, state) => const ContactPage()),
            GoRoute(
                path: '/search',
                builder: (context, state) => const SearchPage()),
            GoRoute(
                path: '/setting',
                builder: (context, state) => const SettingPage()),
          ])
    ]);
