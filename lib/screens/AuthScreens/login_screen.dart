import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/resources/auth_methods.dart';
import 'package:pharmacy_management_system/screens/AuthScreens/sign_up_screen.dart';
import 'package:pharmacy_management_system/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // dispose the controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.0,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.0,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ),
              const SizedBox(height: 32.0),
              load
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        // authentication logic
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        // validation logic
                        if (email.isEmpty) {
                          // add a snackbar
                          showSnackBar(context, "Email field can't be empty");
                        } else if (password.isEmpty) {
                          // add a snackbar
                          showSnackBar(
                              context, "Password field can't be empty");
                        } else {
                          setState(() {
                            load = true;
                          });

                          // log in the user and navigate to the home screen
                          await AuthMethods()
                              .signIn(email: email, password: password);
                        }
                      },
                      child: const Text('Login'),
                    ),

              const SizedBox(
                height: 16.0,
              ),

              // navigate the user to the sign up screen
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
                  },
                  child: const Text("Don't have an account? Sign up"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
