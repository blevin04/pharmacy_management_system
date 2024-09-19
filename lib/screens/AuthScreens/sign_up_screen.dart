import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/resources/auth_methods.dart';
import 'package:pharmacy_management_system/screens/AuthScreens/login_screen.dart';

import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _userTitleController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _ageController.dispose();
    _idNumberController.dispose();
    _phoneController.dispose();
    _userTitleController.dispose();
    super.dispose();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                  ),
                ),
                const SizedBox(height: 16.0),

                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _phoneController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(labelText: 'Age'),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _idNumberController,
                    decoration: const InputDecoration(labelText: 'ID Number'),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _userTitleController,
                    decoration: const InputDecoration(labelText: 'User Title'),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                ),
                const SizedBox(height: 32.0),
                loading
                    ? const CircularProgressIndicator(
                        strokeWidth: 3.0,
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          // text input fields validations
                          if (_usernameController.text.isEmpty) {
                            // show snackbar
                            showSnackBar(
                                context, "Username field can't be empty");
                          } else if (_emailController.text.isEmpty) {
                            // show snackbar
                            showSnackBar(context, "Email field can't be empty");
                          } else if (_passwordController.text.isEmpty) {
                            // show snackbar
                            showSnackBar(
                                context, "Password field can't be empty");
                          } else {
                            setState(() {
                              loading = true;
                            });
                            // register user by sending the data to the database
                            String signUpSuccess =
                                await AuthMethods().createAccount(
                              email: _emailController.text,
                              password: _passwordController.text,
                              fullName: _fullNameController.text,
                              phone: _phoneController.text,
                              userTitle: _userTitleController.text,
                              idNumber: _idNumberController.text,
                              age: _ageController.text,
                            );

                            if (signUpSuccess == "success") {
                              AuthMethods().signIn(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: const Text('Sign Up'),
                      ),

                const SizedBox(
                  height: 16.0,
                ),

                // navigate the user to the log in screen
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  },
                  child: const Text("Aleady have an account? Log in"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
