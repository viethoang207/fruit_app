import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/blocs/auth/auth_bloc.dart';
import 'package:training_example/generated/assets.dart';
import 'package:training_example/utils/snackbar_hepler.dart';
import 'package:training_example/utils/string_helper.dart';
import 'package:training_example/views/authentication/sign_up_page.dart';

import '../../di/injection.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  bool _obscurePassword = true;

  var authBloc = getIt.get<AuthBloc>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: BlocListener<AuthBloc, AuthState>(
              bloc: authBloc,
                listener: (context, state) {
                  if (state is AuthenticateErrorState) {
                    setState(() {
                      isLoading = false;
                    });
                    SnackBarHelper.showMessage(context: context, message: state.error, duration: const Duration(seconds: 5), hideAction: 'OK');
                  } else if (state is Loading) {
                    setState(() {
                      isLoading = true;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: isLoading == true ?
                const Center(child: CircularProgressIndicator()) :
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      Assets.assetsHelloFruit,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.grey,
                        fontFamily: 'Mukta-Bold'
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email_outlined),
                                labelStyle: const TextStyle(fontFamily: 'Mukhtar-Medium'),
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
                                suffixIcon: IconButton(
                                  icon: Icon(_obscurePassword? Icons.visibility : Icons.visibility_off),
                                  onPressed: () => setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  }),
                                ),
                                prefixIcon: const Icon(Icons.key_outlined),
                                labelText: 'Password',
                                labelStyle: const TextStyle(fontFamily: 'Mukhtar-Medium'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              obscureText: _obscurePassword,
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
                    ),
                    const SizedBox(height: 30),
                    const Text(
                        'or',
                      style: TextStyle(
                        fontFamily: 'Mukta-Medium',
                        fontSize: 18,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                          builder: (context) => const SignUpPage()
                        ));
                      },
                      child: Text(
                        'Create new account',
                        style: TextStyle(
                            fontFamily: 'Mukta-Medium',
                            fontSize: 18,
                            color: Colors.grey.shade700,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

  // Form field validators
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty || value.length < 8 || !StringHelper.isEmailFormat(value)) {
      return 'Email is invalid';
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
      authBloc.add(LoginRequest(email: username, password: password));
    }
  }
}
