import 'package:flutter/material.dart';

import 'home_page.dart';

class AdditionalDetails extends StatefulWidget {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  const AdditionalDetails(
      {super.key, this.email, this.password, this.firstName, this.lastName});

  @override
  State<AdditionalDetails> createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
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
              decoration: const InputDecoration(
                hintText: 'Address 1',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Address 2 (optional)',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'City',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Province',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Postal Code',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Date of Birth',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
                child: const Text('Finish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
