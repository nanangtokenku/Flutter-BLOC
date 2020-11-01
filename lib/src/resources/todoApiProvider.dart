import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:aztira/src/models/todoModel0.dart';

class TodoApiProvider {
  Client client = Client();
  List<Todo> todo;

  //final _url = "https://uncok.jogjaide.web.id/cadmin/native/getAll.php";
  final _url = "https://uncok.jogjaide.web.id/cadmin/api/todo/all";
  Future<List<Todo>> fetchTodoList() async {
    print("masuk fungsi");
    final response = await client.get(_url, headers: {
      'x-api-key': '4DE868BD51F2BE7C724A9E9A3415C4BA',
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
      throw Exception("Gagal Data");
    }
  }
}
