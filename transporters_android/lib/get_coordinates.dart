import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';

class Coordinates {
  late Future<LatLng> _coordinates;

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
}
