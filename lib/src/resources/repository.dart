import 'package:aztira/src/models/todoModel0.dart';
import 'package:aztira/src/models/nodeModel.dart';
import 'package:aztira/src/resources/todoApiProvider.dart';
import 'package:aztira/src/resources/nodeApiProvider.dart';
import 'dart:async';
import 'loginApiProvider.dart';

class Repository {
  final todoApiProvider = TodoApiProvider();
  final nodeApiProvider = NodeApiProvider();
  final userApiProvider = LoginApiProvider();
  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
  Future<List<Node>> fetchAllNode() => nodeApiProvider.fetchNodeList();
  Future<bool> fetchAllLogin(email, password) =>
      userApiProvider.fetchUserList(email, password);
}
