import 'package:flutter/material.dart';
import 'package:transporters_android/components/address_bar/location_list_tile.dart';
import 'package:transporters_android/constants.dart';
import 'package:transporters_android/models/autocomplate_prediction.dart';
import 'package:transporters_android/models/place_auto_complate_response.dart';
import '../network_utility.dart';

class AutocompletePlaces extends StatefulWidget {
  const AutocompletePlaces({Key? key}) : super(key: key);

  @override
  State<AutocompletePlaces> createState() => _AutocompletePlacesState();
}

class _AutocompletePlacesState extends State<AutocompletePlaces> {
  TextEditingController _controller = TextEditingController();
  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplete(String query) async {
    Uri uri = Uri.https(
      'maps.googleapis.com',
      'maps/api/place/autocomplete/json',
      {
        "input": query,
        "key": apiKey,
      },
    );

    String? response = await NetworkUtitlity.fetchUrl(uri);

    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);

      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Search Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search Address',
              ),
              onChanged: (value) {
                placeAutocomplete(value);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: placePredictions.length,
                itemBuilder: (context, index) => LocationListTile(
                  press: () {
                    Navigator.pop(
                        context, placePredictions[index].description!);
                  },
                  location: placePredictions[index].description!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
