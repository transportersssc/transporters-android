import 'package:flutter/material.dart';
import 'package:transporters_android/components/address_bar/address_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.81;
    final _fromController = TextEditingController();
    final _toController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        automaticallyImplyLeading: false,
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
                  controller: _fromController,
                  title: "From",
                ),
                AddressBar(
                  controller: _toController,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                      ],
                    ),
                  ],
                ),
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
                Spacer(),
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
                          onPressed: () {},
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
}
