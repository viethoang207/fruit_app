import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_example/models/user_info/bloc/user_info_bloc.dart';

import '../../di/injection.dart';
import '../authentication/blocs/auth_bloc.dart';

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
                  authBloc.add(LogoutRequest());
                },
                child: const Text('Sign out'),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/detail');
                },
                child: const Text('Detail'),
              )
            ],
          )
      ),
    );
  }
}
