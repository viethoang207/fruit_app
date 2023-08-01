import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_example/di/injection.dart';
import 'package:training_example/features/authentication/blocs/auth_bloc.dart';
import 'package:training_example/features/authentication/presentation/login_page.dart';
import 'package:training_example/models/user_info/bloc/user_info_bloc.dart';
import 'package:training_example/routing/app_router.dart';
import 'package:training_example/features/splash/introduction_page.dart';

import 'constants/fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configureDependencies();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  if (isFirstTime && FirebaseAuth.instance.currentUser != null) {
    FirebaseAuth.instance.signOut();
  }

  runApp(MaterialApp(
      theme: ThemeData(fontFamily: Fonts.muktaRegular),
      debugShowCheckedModeBanner: false,
      home: isFirstTime ? const IntroductionPage() : const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<UserInfoBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<AuthBloc>(),
        )
      ],
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              if (snapshot.hasData) {
                return MaterialApp.router(
                    debugShowCheckedModeBanner: false, routerConfig: router);
              } else {
                return const LoginPage();
              }
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
