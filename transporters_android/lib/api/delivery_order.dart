import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

void main(List<String> args) async {
  regenerateToken();
}

const urlPrefix = 'http://10.0.2.2:8080/api';
// const urlPrefix = 'http://localhost:8080/api';

// Place Container
Future<String> placeOrder({
  required String originAddress,
  required String destinationAddress,
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
      '{ "originAddress": "$originAddress", "destinationAddress": "$destinationAddress", "packageType": $packageTypeEncoded, "packageSize": "$packageSize" }';
  final response = await post(url, headers: headers, body: jsonBody);

  if (response.statusCode == 401) {
    await regenerateToken();
    const storage = FlutterSecureStorage();
    var newToken = await storage.read(key: 'token');
    placeOrder(
        originAddress: originAddress,
        destinationAddress: destinationAddress,
        packageType: packageType,
        packageSize: packageSize,
        token: newToken!);
  }

  return response.body;
}

Future<void> regenerateToken() async {
  final url = Uri.parse('$urlPrefix/v1/tokens');
  final headers = {
    "Content-type": "application/json",
  };

  const storage = FlutterSecureStorage();
  var refreshToken = await storage.read(key: 'refreshToken');

  var jsonBody = '{ "refreshToken": "$refreshToken" }';
  final response = await post(url, headers: headers, body: jsonBody);

  Map<String, dynamic> serializedResponse = jsonDecode(response.body);

  if (serializedResponse['success'] == 'true') {
    await storage.write(key: 'token', value: serializedResponse['token']);
  }
}
