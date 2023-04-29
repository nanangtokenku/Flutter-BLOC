import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:aztira/src/config/konstanta.dart';

import '../models/satuanModel.dart';

class SatuanApiProvider {
  Client client = Client();
  List<Satuan> node;

  Future<List<Satuan>> fetchSatuanList() async {
    final response = await client.get(urlSatuan, headers: {
      'x-api-key': xApiKeyStok,
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);

      print(jsondata);

      return (jsondata['data']['units_of_measurement'] as List)
          .map((data) => new Satuan.fromJson(data))
          .toList();
    } else {
      throw Exception("Gagal Mengambil Data");
    }
  }

  fetchUserList() {}
}
