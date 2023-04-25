import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transporters_android/api/customer_api.dart';
import 'package:transporters_android/constants.dart';
import 'package:transporters_android/helpers/form_validation.dart';

import 'home_page.dart';

class AdditionalDetails extends StatefulWidget {
  final String? email;
  final String? password;
  final String? username;
  const AdditionalDetails(
      {super.key, this.email, this.password, this.username});

  @override
  State<AdditionalDetails> createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final DateTime date = DateTime.now();
  bool error = false;
  String errorText = '';
  final _formKey = GlobalKey<FormState>();

  void register() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    await registerCustomer(
            email: widget.email!,
            password: widget.password!,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            dateOfBirth: _dobController.text,
            username: widget.username!,
            phone: _phoneController.text)
        .then((value) {
      if (value == "201") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Oops..'),
              content: const Text('Something went wrong!!!'),
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
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Information'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
                validator: (firstName) {
                  if (firstName!.isEmpty) {
                    return "First Name cannot be empty";
                  }
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
                validator: (lastName) {
                  if (lastName!.isEmpty) {
                    return "Last Name cannot be empty";
                  }
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                ),
                validator: (phone) {
                  RegExp phoneRegEx = RegExp(
                      r"^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$");
                  if (phone!.isEmpty) {
                    return "Phone Number cannot be empty";
                  }
                  if (!phoneRegEx.hasMatch(phone)) {
                    return "Phone Number is not in format";
                  }
                },
              ),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  hintText: 'Date of Birth',
                ),
                validator: (dob) {
                  if (dob!.isEmpty) {
                    return "Date of Birth cannot be empty";
                  }
                },
                onTap: _showDatePicker,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register();
                    }
                  },
                  child: const Text('Finish'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 10 * 365)),
      firstDate: DateTime(1960),
      lastDate: DateTime.now().subtract(const Duration(days: 10 * 365)),
    ).then((value) {
      setState(() {
        _dobController.text = "${value!.month}-${value.day}-${value.year}";
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
  }
}
