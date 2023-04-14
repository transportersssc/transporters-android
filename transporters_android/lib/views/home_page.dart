import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:transporters_android/components/address_bar/address_bar.dart';
import 'package:transporters_android/components/type_selector/type_selector.dart';
import 'package:transporters_android/stores/item_type_store.dart';
import 'package:transporters_android/views/login.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ItemTypeStore store = GetIt.instance<ItemTypeStore>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.81;
    final fromController = TextEditingController();
    final toController = TextEditingController();

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
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurple,
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
                AddressBar(
                  controller: fromController,
                  title: "From",
                ),
                AddressBar(
                  controller: toController,
                  title: "To`",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Text(
                        'S',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Text(
                        'M',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Text(
                        'L',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Subtotal: ',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              '\$ 12.49',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print(store.itemSelected.toList());
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
