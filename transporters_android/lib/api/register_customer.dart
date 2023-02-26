import 'package:http/http.dart';

void main(List<String> args) {
  registerCustomer(
      email: "sumeet3@gmail.com",
      password: "Password@123",
      firstName: "Sumeet",
      lastName: "Shrivastava",
      dateOfBirth: "2-8-1996",
      username: "qwertty12",
      phone: "2262014677");
}

const urlPrefix = 'https://transporters-api-dev.up.railway.app/api';

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
  print(response.statusCode);
  print(response.request);
  print(response.body);
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