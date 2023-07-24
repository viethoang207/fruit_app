import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/di/injection.dart';
import 'package:training_example/features/authentication/login_page.dart';
import 'package:training_example/repositories/auth_repository.dart';
import 'package:training_example/routing/app_router.dart';
import 'blocs/auth/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configureDependencies();

  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => getIt.get<AuthBloc>(),
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: router,
              );
            } else {
              return LoginPage(bloc: context.read<AuthBloc>());
            }
          },
        ),
      ),
    );
  }
}
