import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:transporters_android/components/address_bar/address_bar.dart';
import 'package:transporters_android/components/size_selector/size_selector.dart';
import 'package:transporters_android/components/type_selector/type_selector.dart';
import 'package:transporters_android/constants.dart';
import 'package:transporters_android/stores/item_type_store.dart';
import 'package:transporters_android/stores/place_order_store.dart';
import 'package:transporters_android/stores/size_selector_store.dart';
import 'package:transporters_android/views/login.dart';

import 'confirmation_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ItemTypeStore itemTypeStore = GetIt.instance<ItemTypeStore>();

  final SizeSelectorStore sizeSelectorStore =
      GetIt.instance<SizeSelectorStore>();

  final PlaceOrderStore placeOrderStore = GetIt.instance<PlaceOrderStore>();

  final fromController = TextEditingController();
  final toController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.81;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logoutUser(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: secondaryColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Phone',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) => AddressBar(
                    controller: fromController,
                    title: "From",
                  ),
                ),
                Observer(
                  builder: (_) => AddressBar(
                    controller: toController,
                    title: "To",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Item Type',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TypeSelector(),
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Dimension',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizeSelector(),
                const Spacer(),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Subtotal: ',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            Observer(
                              builder: (_) => const Text(
                                'CAD\$ 0.0',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor),
                          onPressed: () {
                            placeOrderStore.fromAddress = fromController.text;
                            placeOrderStore.toAddress = toController.text;

                            if (placeOrderStore.correctInputs()) {
                              // Add API integration and navigation
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ConfirmationScreen(),
                                ),
                              );
                            }
                          },
                          child: const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logoutUser(BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage()));
  }
}
