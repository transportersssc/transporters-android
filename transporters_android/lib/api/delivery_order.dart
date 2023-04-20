import 'dart:convert';

import 'package:http/http.dart';

void main(List<String> args) async {
  print(await placeOrder(
      originAddress: "75 yotk",
      destinationAddress: "destinationAddress",
      originLatitude: 43.476997,
      originLongitude: -80.523671,
      destinationLatitude: 43.489076,
      destinationLongitude: -80.5310518,
      distance: 3,
      packageType: ["food", "medicines"],
      packageSize: "M",
      token:
          "eyJhbGciOiJSUzI1NiIsImtpZCI6IjE2ZGE4NmU4MWJkNTllMGE4Y2YzNTgwNTJiYjUzYjUzYjE4MzA3NzMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vdHJhbnNwb3J0ZXJzLWRldiIsImF1ZCI6InRyYW5zcG9ydGVycy1kZXYiLCJhdXRoX3RpbWUiOjE2ODE5NTEzOTYsInVzZXJfaWQiOiI2NDMwOTZiODdiNzg3ZTdkNTNjZmM3MGIiLCJzdWIiOiI2NDMwOTZiODdiNzg3ZTdkNTNjZmM3MGIiLCJpYXQiOjE2ODE5NTEzOTYsImV4cCI6MTY4MTk1NDk5NiwiZW1haWwiOiJzdW1lZXRAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInN1bWVldEBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.THWlfg-TuYu_3joaPfGPfytlIl62bZV8AOYTEc1od8GLSQWPSbNSQAAyneCfMJtRZV2XO7LK2c2SaPQ3s04KI8FUCLlcDrE_jjzS3Cq7RbzlAnTqGBq_G8_OZl9HbhAkf67jc0qudw8VMkY8SymbhOXgnpfLRILYmqdvn-kN0tEtwNORYVMI29M9-kf4fjOiROaCADS4rFy3FH37IHN4vzkxlJuGMfz1lredrNjbkjeFrYrD9IuhrfMjHdwQviiMjq6wdYc-4QSOWpN8yo1W6qf1Cs4Maleo7dlGX-GF2hfk_xBTyWCP6zwWXMJAltDu7ciGISIVEst4PEHOb9a7Sw"));
}

const urlPrefix = 'http://10.0.2.2:8080/api';
// const urlPrefix = 'http://localhost:8080/api';

// Register Customer
Future<String> placeOrder({
  required String originAddress,
  required String destinationAddress,
  required double originLatitude,
  required double originLongitude,
  required double destinationLatitude,
  required double destinationLongitude,
  required double distance,
  required List<String> packageType,
  required String packageSize,
  required String token,
}) async {
  final url = Uri.parse('$urlPrefix/v1/orders');
  final headers = {
    "Content-type": "application/json",
    "Authorization": "Bearer $token"
  };

  String packageTypeEncoded = jsonEncode(packageType);
  var jsonBody =
      '{ "origin": { "address": "$originAddress", "longitude": $originLongitude, "latitude": $originLatitude }, "destiny": { "address": "$destinationAddress", "longitude": $destinationLongitude, "latitude": $destinationLatitude }, "distanceInKilometers": $distance, "packageType": $packageTypeEncoded, "packageSize": "$packageSize" }';
  final response = await post(url, headers: headers, body: jsonBody);
  print('The response code is: ${response.statusCode}');
  print('The response is: ${response.body}');
  return response.body;
}
