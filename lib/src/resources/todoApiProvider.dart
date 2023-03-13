import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:aztira/src/models/todoModel0.dart';
import 'package:aztira/src/config/konstanta.dart';

class TodoApiProvider {
  Client client = Client();
  List<Todo> todo;

  final _url = "https://api.jogjaide.web.id/api/todo/all";

  Future<List<Todo>> fetchTodoList() async {
    final response = await client.get(_url, headers: {
      'x-api-key': x_api_key,
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);

      print(jsondata);

      return (jsondata['data']['todo'] as List)
          .map((data) => new Todo.fromJson(data))
          .toList();

      //print(todo[0].id);
      //return compute(todoFromJson, response.body);
    } else {
      throw Exception("Gagal Mengambil Data");
    }
  }
}
