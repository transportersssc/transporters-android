import 'package:http/http.dart';

void main(List<String> args) async {
  print(await loginCustomer(
      email: "sumeet7@gmail.com", password: "Password@123"));
}

const urlPrefix = 'http://10.0.2.2:8080/api';

// Register Customer
Future<String> registerCustomer({
  required String email,
  required String password,
  required String firstName,
  required String lastName,
  required String dateOfBirth,
  required String username,
  required String phone,
}) async {
  final url = Uri.parse('$urlPrefix/v1/registration');
  final headers = {
    "Content-type": "application/json",
  };

  var json_body =
      '{ "email": "$email", "password": "$password", "firstName": "$firstName", "lastName": "$lastName", "dateOfBirth": "$dateOfBirth" , "username": "$username", "phone": "$phone"}';

  final response = await post(url, headers: headers, body: json_body);
  return response.statusCode.toString();
}

// Check if Customer already exists
Future<String> checkCustomer({required String email}) async {
  final url = Uri.parse('$urlPrefix/v1/users/$email');
  final headers = {
    "Content-type": "application/json",
  };

  final response = await head(url, headers: headers);
  return response.statusCode.toString();
}

// Login Customer

Future<String> loginCustomer(
    {required String email, required String password}) async {
  final url = Uri.parse('$urlPrefix/v1/authentication');
  final headers = {"Content-type": "application/json"};

  var json_body = '{ "username": "$email", "password": "$password" }';

  final response = await post(url, headers: headers, body: json_body);
  return response.body;
}
