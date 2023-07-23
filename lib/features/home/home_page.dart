import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/blocs/auth/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                context.read<AuthBloc>().add(LogoutRequest());
              },
              child: const Text('Sign out'),
            )
          ],
        )
      ),
    );
  }
}
