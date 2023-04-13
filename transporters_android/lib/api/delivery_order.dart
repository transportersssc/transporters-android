import 'package:http/http.dart';

void main(List<String> args) async {
  print(await placeOrder(
      originAddress: "455 King St. North N4N HT5 Kitchener ON Canada",
      originLongitude: -122.4194,
      originLatitude: 37.7749,
      destinationAddress: "455 King St. North N4N HT5 Kitchener ON Canada",
      destinationLongitude: -122.4194,
      destinationLatitude: 37.7749,
      distance: 5,
      packageType: ["food", "groceries"],
      packageSize: "M"));
}

const urlPrefix = 'http://localhost:8080/api';

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
}) async {
  final url = Uri.parse('$urlPrefix/v1/orders');
  final headers = {
    "Content-type": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg3YzFlN2Y4MDAzNGJiYzgxYjhmMmRiODM3OTIxZjRiZDI4N2YxZGYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vdHJhbnNwb3J0ZXJzLWRldiIsImF1ZCI6InRyYW5zcG9ydGVycy1kZXYiLCJhdXRoX3RpbWUiOjE2ODAzMDYyOTgsInVzZXJfaWQiOiI2NDI3NzA3OTlkZjFmNWNlNzM3ZTUxNjQiLCJzdWIiOiI2NDI3NzA3OTlkZjFmNWNlNzM3ZTUxNjQiLCJpYXQiOjE2ODAzMDYyOTgsImV4cCI6MTY4MDMwOTg5OCwiZW1haWwiOiJzdW1lZXQyQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJzdW1lZXQyQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.HqE3F7IC7Qcn84uiUFSmuT6s_CnYltDzi4kyp7Ib7Ej5hzCC6MT2WFqEmYDXEAsAIBf3dHgX6D4wGBaEzIKO-JzkGiO-3Hz3_-VzG63cHSJ7RIxg_aPxRmGLwgkKOuOqmg56uVIwsr0P31CQs8tfBCvc1YnU7rk-2qeECpZ0gdnUEfrJqXRbJhPyrXx1jbKcEktjv5PltIicmxBffC9cIbvw685mawWvlo6cctODSzDzMulG8sSwMlZKscAul_Vq2nFhIrfTdNrsZnVHGDVMRhz6gp77udDKJx6Orp1Y3W4R1-aBd8KbTPW75vxC48qUVB63eUlkf9lpQNrT-EghTQ"
  };

  var json_body =
      '{ "origin": { "address": "$originAddress", "longitude": $originLongitude, "latitude": $originLatitude }, "destiny": { "address": "$destinationAddress", "longitude": $destinationLongitude, "latitude": $destinationLatitude }, "distanceInKilometers": $distance, "packageType": $packageType, "packageSize": $packageSize }';

  final response = await post(url, headers: headers, body: json_body);
  return response.body;
}
