import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:aztira/src/config/konstanta.dart';

import '../models/userModel.dart';

class LoginApiProvider {
  Client client = Client();
  User user;

  Future<User> fetchUserList() async {
    final params = {'username': 'fe@fe.com', 'password': '12345678'};
    final query = Uri(queryParameters: params).query;
    final response = await client.post(urlLogin,
        headers: {
          'x-api-key': xApiKey,
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: query);

    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);

      print(jsondata);

      return User.fromJson(jsondata);
    } else {
      print(response.statusCode);
      throw Exception("Gagal Mengambil Data Login");
    }
  }
}
