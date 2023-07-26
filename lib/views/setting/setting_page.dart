import 'package:flutter/material.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../di/injection.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var authBloc = getIt.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
