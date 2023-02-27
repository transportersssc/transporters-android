import 'package:flutter/material.dart';
import 'package:transporters_android/api/customer_api.dart';
import 'package:transporters_android/home_page.dart';
import 'package:transporters_android/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordInvisible = true;
  BuildContext? dialogContext;
  void loginUser() async {
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

    await loginCustomer(
            email: _emailController.text, password: _passwordController.text)
        .then((statusCode) {
      if (statusCode == "200") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ),
        );
      } else {
        Navigator.pop(dialogContext!);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Incorrect Credentials'),
              content: const Text(
                  'This combination of email and password is incorrect'),
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginUser();
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
              child: const Text('Sign Up'),
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
  }
}
