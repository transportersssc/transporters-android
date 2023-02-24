import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Information'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            TextFormField(
              controller: _dobController,
              decoration: const InputDecoration(
                hintText: 'Date of Birth',
              ),
              onTap: _showDatePicker,
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
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    phone: _phoneController.text,
                    dateofBirth: _dobController.text,
                  );

                  bool dataValidated = data.validateAdditionalDetails();
                  if (dataValidated) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    );
                  } else {
                    error = true;
                    errorText = data.error.toString();
                    setState(() {});
                  }
                },
                child: const Text('Finish'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1960),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _dobController.text = "${value!.month} - ${value.day} - ${value.year}";
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
