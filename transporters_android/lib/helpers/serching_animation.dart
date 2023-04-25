import 'package:flutter/material.dart';

class SearchingAnimation extends StatefulWidget {
  const SearchingAnimation({super.key});

  @override
  State<SearchingAnimation> createState() => _SearchingAnimationState();
}

class _SearchingAnimationState extends State<SearchingAnimation>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 0.5,
        upperBound: 0.9);
    // _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      }
      if (_animationController.isDismissed) {
        _animationController.forward();
      }
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Searching Driver')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildContainer(listRadius[0]),
            buildContainer(listRadius[1]),
            buildContainer(listRadius[2]),
            buildContainer(listRadius[3]),
            buildContainer(listRadius[4]),
            Image.asset(
              'assets/images/temp_image.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(radius) {
    return Container(
      width: radius * _animationController.value,
      height: radius * _animationController.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF4A148C).withOpacity(1.0 - _animationController.value),
      ),
    );
  }
}
