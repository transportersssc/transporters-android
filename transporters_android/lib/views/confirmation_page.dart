import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:transporters_android/views/order_placed_view.dart';

import '../stores/item_type_store.dart';
import '../stores/place_order_store.dart';
import '../stores/size_selector_store.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({super.key});

  final ItemTypeStore itemTypeStore = GetIt.instance<ItemTypeStore>();

  final SizeSelectorStore sizeSelectorStore =
      GetIt.instance<SizeSelectorStore>();

  final PlaceOrderStore placeOrderStore = GetIt.instance<PlaceOrderStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text('Origin Address: '),
              Text(placeOrderStore.fromAddress),
            ],
          ),
          Row(
            children: [
              const Text('Destination Address: '),
              Text(placeOrderStore.toAddress),
            ],
          ),
          Row(
            children: [
              const Text('Distance: '),
              Text(placeOrderStore.distance.toString()),
            ],
          ),
          Row(
            children: [
              const Text('Package Types: '),
              Text(itemTypeStore.itemSelected.toString()),
            ],
          ),
          Row(
            children: [
              const Text('Package Size: '),
              Text(sizeSelectorStore.selectedSize),
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                const storage = FlutterSecureStorage();
                bool response = await placeOrderStore.createOrder(
                  fromAddress: placeOrderStore.fromAddress,
                  fromLatitude: 43.476997,
                  fromLongitude: -80.523671,
                  toAddress: placeOrderStore.toAddress,
                  toLatitude: 43.489076,
                  toLongitude: -80.5310518,
                  distance: 3.2,
                  packageType: ["food", "medicines"],
                  packageSize: sizeSelectorStore.selectedSize,
                );

                String msg = '';

                if (response) {
                  msg = 'Order Placed';
                } else {
                  msg = 'Something went wrong';
                }

                Fluttertoast.showToast(
                  msg: msg,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderPlacedScreen(),
                  ),
                );
              },
              child: const Text('Continue'))
        ],
      ),
    );
  }
}
