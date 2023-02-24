import 'package:http/http.dart';

void main(List<String> args) {
  registerCustomer(
    email: "sumeet@test.com",
    password: "Password@123",
    firstName: "Sumeet",
    lastName: "Shrivastava",
  );
}

// const urlPrefix = 'http://10.0.2.2:42500/api';
const urlPrefix = 'https://transporters-api-dev.up.railway.app/api';

Future<void> registerCustomer({
  required String email,
  required String password,
  required String firstName,
  required String lastName,
}) async {
  final url = Uri.parse('$urlPrefix/v1/registration');
  final headers = {
    "Content-type": "application/json",
  };

  var json_body =
      '{ "email": "$email", "password": "$password", "firstName": "$firstName", "lastName": "$lastName"}';

  final response = await post(url, headers: headers, body: json_body);
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
}
