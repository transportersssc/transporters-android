import 'package:flutter/material.dart';
import 'package:transporters_android/helpers/form_validation.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
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
            ),
            if (error)
              SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    errorText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FormValidation data = FormValidation(
                    email: _emailController.text,
                    password: _passwordController.text,
                    confirmPassword: _confirmPasswordController.text,
                    username: _usernameController.text,
                  );

                  bool dataValidated = data.validateSignup();
                  if (dataValidated) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AdditionalDetails(
                          email: _emailController.text,
                          password: _passwordController.text,
                          username: _usernameController.text,
                        ),
                      ),
                    );
                  } else {
                    error = true;
                    errorText = data.error.toString();
                    setState(() {});
                  }
                },
                child: const Text('Sign Up'),
              ),
            ),
          ],
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
