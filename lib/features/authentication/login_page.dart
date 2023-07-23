import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/blocs/auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  final AuthBloc bloc;

  const LoginPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthenticateErrorState) {
                setState(() {
                  isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () =>
                        ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                  ),
                ));
              } else if (state is Loading) {
                setState(() {
                  isLoading = true;
                });
              }
            },
            child: isLoading == true ?
            const Center(child: CircularProgressIndicator()) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/firebase_logo.png'),
                const SizedBox(height: 10),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 40, color: Colors.grey),
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: _validateUsername,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          obscureText: true,
                          validator: _validatePassword,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                      )),
                )
              ],
            )
        ),
      ),
    );
  }

  // Form field validators
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Username is invalid';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Password is invalid';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;
      widget.bloc.add(LoginRequest(email: username, password: password));
    }
  }
}
