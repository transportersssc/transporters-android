import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:transporters_android/components/address_bar/address_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice_ex/directions.dart';
import 'package:http/http.dart' as http;
import 'package:transporters_android/confirmation_page.dart';
import 'constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final directions = GoogleMapsDirections(apiKey: apiKey);
  late LatLng _fromCoordinates, _toCoordinates;

  Future<LatLng> getCoordinates(String address) async {
    final query = Uri.encodeComponent(address);
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$query&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data["status"] == "OK") {
      final location = data["results"][0]["geometry"]["location"];
      final lat = location["lat"];
      final lng = location["lng"];
      return LatLng(lat, lng);
    } else {
      throw Exception("Failed to get coordinates from address");
    }
  }

  Future<String> getDrivingDistance(LatLng origin, LatLng destination) async {
    final startLatitude = origin.latitude;
    final startLongitude = origin.longitude;
    final endLatitude = destination.latitude;
    final endLongitude = destination.longitude;
    final apiUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$startLatitude,$startLongitude&destination=$endLatitude,$endLongitude&mode=driving&key=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final distance = jsonResponse["routes"][0]["legs"][0]["distance"]["text"];
      return distance;
    } else {
      throw Exception("Failed to get driving distance");
    }
  }

  void buttonClick() async {
    _fromCoordinates = await getCoordinates(_fromController.text);
    _toCoordinates = await getCoordinates(_toController.text);
    final distance = await getDrivingDistance(_fromCoordinates, _toCoordinates);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(
          distance: distance,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.81;
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
                          onPressed: buttonClick,
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
