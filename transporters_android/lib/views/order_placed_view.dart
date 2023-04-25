import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transporters_android/helpers/serching_animation.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  late Timer _timer;
  bool _showSearchingAnimation = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 15), () {
      setState(() {
        _showSearchingAnimation = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchingAnimation(),
    );
  }
}
