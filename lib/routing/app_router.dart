import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import 'package:training_example/features/cart/presentation/cart_page.dart';
import 'package:training_example/features/general_page/general_page.dart';
import 'package:training_example/features/home/presentation/home_page.dart';
import 'package:training_example/features/search/presentation/search_page.dart';
import 'package:training_example/features/setting/presentation/change_language.dart';
import 'package:training_example/features/setting/presentation/setting_page.dart';
import 'package:training_example/models/product/product.dart';

import '../features/detail/detail_page.dart';
import '../features/setting/presentation/change_name.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/main',
    routes: [
      GoRoute(
          path: '/main',
          builder: (context, state) {
            return const GeneralPage();
          }),
      GoRoute(
          path: '/detail',
          name: 'detail',
          builder: (context, state) {
            Product item = state.extra as Product;
            return DetailPage(fruitItem: item);
          }),
      GoRoute(
          path: '/language',
          name: 'language',
          builder: (context, state) {
            return const ChangeLanguagePage();
          }),
      GoRoute(
          path: '/changeName',
          name: 'changeName',
          builder: (context, state) {
            String name = state.extra as String;
            return ChangeNamePage(currentName: name);
          }),
    ]);
