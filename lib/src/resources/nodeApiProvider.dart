import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:aztira/src/models/nodeModel.dart';
import 'package:aztira/src/config/konstanta.dart';

class NodeApiProvider {
  Client client = Client();
  List<Node> node;

  final _url = urlTodo;

  Future<List<Node>> fetchNodeList() async {
    final response = await client.get(_url, headers: {
      'x-api-key': xApiKey,
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);

      //print(jsondata);

      return (jsondata['data']['todo'] as List)
          .map((data) => new Node.fromJson(data))
          .toList();

      //print(todo[0].id);
      //return compute(todoFromJson, response.body);
    } else {
      throw Exception("Gagal Mengambil Data");
    }
  }
}
