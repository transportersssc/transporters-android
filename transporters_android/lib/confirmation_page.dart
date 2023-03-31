import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String? distance;
  const ConfirmationScreen({super.key, this.distance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(distance.toString()),
      ),
    );
  }
}
