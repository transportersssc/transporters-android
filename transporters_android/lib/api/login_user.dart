import 'package:http/http.dart';

void main(List<String> args) {
  loginCustomer(email: "sumeet@test.com", password: "Password@123");
}

const urlPrefix = 'https://transporters-api-dev.up.railway.app/api';

Future<void> loginCustomer(
    {required String email, required String password}) async {
  final url = Uri.parse('$urlPrefix/v1/authentication');
  final headers = {"Content-type": "application/json"};

  var json_body = '{ "username": "$email", "password": "$password" }';

  final reponse = await post(url, headers: headers, body: json_body);
  print('Status Code: ${reponse.statusCode}');
  print('Body: ${reponse.body}');
}
