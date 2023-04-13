
import 'package:flutter/material.dart';
import 'package:transporters_android/api/customer_api.dart';

import 'additional_details.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordInvisible = true;
  bool _confirmPasswordInvisible = true;

  // Text Editing Controller for each Text Field
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool error = false;
  String errorText = '';
  final _formKey = GlobalKey<FormState>();
  var focusNode = FocusNode();

  void customerExist() async {
    BuildContext? dialogContext;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        dialogContext = context;
        return Container(
          color: Colors.black.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    final _responseCode =
        await checkCustomer(email: _emailController.text).then((value) {
      if (value == "200") {
        Navigator.pop(dialogContext!);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('User already exists'),
              content: const Text(
                  'An account with the same email/username already exists'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
        focusNode.requestFocus();
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdditionalDetails(
              email: _emailController.text,
              password: _passwordController.text,
              username: _usernameController.text,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (email) {
                  RegExp emailRegEx = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                  if (email!.isEmpty) {
                    return "Email cannot be empty";
                  }

                  if (!emailRegEx.hasMatch(email)) {
                    return "Incorrect Email";
                  }
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
                validator: (username) {
                  RegExp usernameRegEx = RegExp(
                      r"^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$");

                  if (username!.isEmpty) {
                    return "Username cannot be empty";
                  }

                  if (!usernameRegEx.hasMatch(username)) {
                    return "Incorrect Username Pattern";
                  }
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _passwordInvisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordInvisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: _passwordInvisible
                          ? Colors.grey
                          : Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordInvisible = !_passwordInvisible;
                      });
                    },
                  ),
                ),
                validator: (password) {
                  RegExp passwordRegEx = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                  if (password!.isEmpty) {
                    return "Password cannot empty";
                  }

                  if (!passwordRegEx.hasMatch(password)) {
                    return "Incorrect Password Pattern";
                  }
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _confirmPasswordInvisible,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmPasswordInvisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: _confirmPasswordInvisible
                          ? Colors.grey
                          : Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmPasswordInvisible = !_confirmPasswordInvisible;
                      });
                    },
                  ),
                ),
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Password cannot empty";
                  }

                  if (_passwordController.text != password) {
                    return "Passwords do not match";
                  }
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      customerExist();
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}
