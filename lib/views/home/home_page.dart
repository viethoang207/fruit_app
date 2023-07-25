import 'package:flutter/material.dart';
import 'package:training_example/blocs/auth/auth_bloc.dart';
import 'package:training_example/di/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var authBloc = getIt.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // FirebaseAuth.instance.signOut();
                authBloc.add(LogoutRequest());
              },
              child: const Text('Sign out'),
            )
          ],
        )
      ),
    );
  }
}
