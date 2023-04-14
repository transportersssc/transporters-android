import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:transporters_android/stores/item_type_store.dart';

import '../../constants.dart';

class TypeSelector extends StatelessWidget {
  final ItemTypeStore store = GetIt.instance<ItemTypeStore>();
  TypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Observer(
              builder: (_) => ActionChip(
                label: const Text('Food'),
                backgroundColor:
                    store.foodSelected ? primaryColor : Colors.grey,
                labelStyle: TextStyle(
                    color: store.foodSelected ? Colors.white : Colors.black),
                avatar: CircleAvatar(
                  backgroundColor:
                      store.foodSelected ? Colors.white : primaryColor,
                  child: Icon(
                    store.foodSelected ? Icons.check : Icons.add,
                    color:
                        store.foodSelected ? Colors.purple[900] : Colors.white,
                    size: 20.0,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: store.foodSelected ? Colors.blue : Colors.black,
                ),
                onPressed: store.toggleFoodSelected,
              ),
            ),
            Observer(
              builder: (_) => ActionChip(
                label: const Text('Medicines'),
                backgroundColor:
                    store.medicineSelected ? primaryColor : Colors.grey,
                labelStyle: TextStyle(
                    color:
                        store.medicineSelected ? Colors.white : Colors.black),
                avatar: CircleAvatar(
                  backgroundColor:
                      store.medicineSelected ? Colors.white : primaryColor,
                  child: Icon(
                    store.medicineSelected ? Icons.check : Icons.add,
                    color: store.medicineSelected
                        ? Colors.purple[900]
                        : Colors.white,
                    size: 20.0,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: store.medicineSelected ? Colors.blue : Colors.black,
                ),
                onPressed: store.toggleMedicineSelected,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Observer(
              builder: (_) => ActionChip(
                label: const Text('Groceries'),
                backgroundColor:
                    store.grocerySelected ? primaryColor : Colors.grey,
                labelStyle: TextStyle(
                    color: store.grocerySelected ? Colors.white : Colors.black),
                avatar: CircleAvatar(
                  backgroundColor:
                      store.grocerySelected ? Colors.white : primaryColor,
                  child: Icon(
                    store.grocerySelected ? Icons.check : Icons.add,
                    color: store.grocerySelected
                        ? Colors.purple[900]
                        : Colors.white,
                    size: 20.0,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: store.grocerySelected ? Colors.blue : Colors.black,
                ),
                onPressed: store.toggleGrocerySelected,
              ),
            ),
            Observer(
              builder: (_) => ActionChip(
                label: const Text('Documents'),
                backgroundColor:
                    store.documentSelected ? primaryColor : Colors.grey,
                labelStyle: TextStyle(
                    color:
                        store.documentSelected ? Colors.white : Colors.black),
                avatar: CircleAvatar(
                  backgroundColor:
                      store.documentSelected ? Colors.white : primaryColor,
                  child: Icon(
                    store.documentSelected ? Icons.check : Icons.add,
                    color: store.documentSelected
                        ? Colors.purple[900]
                        : Colors.white,
                    size: 20.0,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: store.documentSelected ? Colors.blue : Colors.black,
                ),
                onPressed: store.toggleDocumentSelected,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Observer(
              builder: (_) => ActionChip(
                label: const Text('Gifts'),
                backgroundColor:
                    store.giftSelected ? primaryColor : Colors.grey,
                labelStyle: TextStyle(
                    color: store.giftSelected ? Colors.white : Colors.black),
                avatar: CircleAvatar(
                  backgroundColor:
                      store.giftSelected ? Colors.white : primaryColor,
                  child: Icon(
                    store.giftSelected ? Icons.check : Icons.add,
                    color:
                        store.giftSelected ? Colors.purple[900] : Colors.white,
                    size: 20.0,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: store.giftSelected ? Colors.blue : Colors.black,
                ),
                onPressed: store.toggleGiftSelected,
              ),
            ),
            Observer(
              builder: (_) => ActionChip(
                label: const Text('Package'),
                backgroundColor:
                    store.packageSelected ? primaryColor : Colors.grey,
                labelStyle: TextStyle(
                    color: store.packageSelected ? Colors.white : Colors.black),
                avatar: CircleAvatar(
                  backgroundColor:
                      store.packageSelected ? Colors.white : primaryColor,
                  child: Icon(
                    store.packageSelected ? Icons.check : Icons.add,
                    color: store.packageSelected
                        ? Colors.purple[900]
                        : Colors.white,
                    size: 20.0,
                  ),
                ),
                iconTheme: IconThemeData(
                  color: store.packageSelected ? Colors.blue : Colors.black,
                ),
                onPressed: store.togglePackageSelected,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
