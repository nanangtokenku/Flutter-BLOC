import 'package:aztira/src/models/todoModel0.dart';
import 'package:aztira/src/models/nodeModel.dart';
import 'package:aztira/src/resources/todoApiProvider.dart';
import 'package:aztira/src/resources/nodeApiProvider.dart';
import 'dart:async';

class Repository {
  final todoApiProvider = TodoApiProvider();
  final nodeApiProvider = NodeApiProvider();
  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
  Future<List<Node>> fetchAllNode() => nodeApiProvider.fetchNodeList();
}
