import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:transporters_android/constants.dart';
import 'package:transporters_android/stores/size_selector_store.dart';

class SizeSelector extends StatelessWidget {
  final SizeSelectorStore store = GetIt.instance<SizeSelectorStore>();
  SizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Observer(
          builder: (_) => ActionChip(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            label: const Text('S'),
            backgroundColor:
                store.smallSelected ? primaryColor : secondaryColor,
            labelStyle: TextStyle(
              color: store.smallSelected ? Colors.white : Colors.black,
              fontSize: 20,
            ),
            onPressed: store.toggleSmallSelected,
          ),
        ),
        Observer(
          builder: (_) => ActionChip(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            label: const Text('M'),
            backgroundColor:
                store.mediumSelected ? primaryColor : secondaryColor,
            labelStyle: TextStyle(
              color: store.mediumSelected ? Colors.white : Colors.black,
              fontSize: 20,
            ),
            onPressed: store.toggleMediumSelected,
          ),
        ),
        Observer(
          builder: (_) => ActionChip(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            label: const Text('L'),
            backgroundColor:
                store.largeSelected ? primaryColor : secondaryColor,
            labelStyle: TextStyle(
              color: store.largeSelected ? Colors.white : Colors.black,
              fontSize: 20,
            ),
            onPressed: store.toggleLargeSelected,
          ),
        ),
      ],
    );
  }
}
