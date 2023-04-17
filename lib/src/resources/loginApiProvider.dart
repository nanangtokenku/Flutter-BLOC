import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:aztira/src/config/konstanta.dart';
import '../models/userModel.dart';
import '../utils/AppPreferences.dart';

class LoginApiProvider {
  Client client = Client();
  User user;

  Future<bool> fetchUserList(email, password) async {
    print("Emailnya = " + email.toString());
    print("password = " + password.toString());
    final params = {
      'username': email.toString(),
      'password': password.toString()
    };
    final query = Uri(queryParameters: params).query;
    final response = await client.post(urlLogin,
        headers: {
          'x-api-key': xApiKey,
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: query);

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      String token = jsondata["token"]; // The value to store in session storage

      await AppPreferences.setString('token', token);
      String name = AppPreferences.getString('token', defaultValue: 'John Doe');
      print(name);

      return true;
    } else if (response.statusCode == 406) {
      return false;
    } else {
      return false;
    }
  }
}
