import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:aztira/src/config/konstanta.dart';

import '../models/userModel.dart';

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

    //print(response.statusCode);
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      //print("Data didapatkan");
      //print(jsondata["data"]);
      //return (jsondata['data'] as User);

      //return User.fromJson(jsondata["data"]);
      return true;
    } else if (response.statusCode == 406) {
      return false;
    } else {
      //print(response.statusCode);
      //throw Exception("Gagal Mengambil Data Login");
      return false;
    }
  }
}
