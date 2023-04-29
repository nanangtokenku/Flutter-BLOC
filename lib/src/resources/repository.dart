import 'package:aztira/src/models/todoModel0.dart';
import 'package:aztira/src/models/nodeModel.dart';
import 'package:aztira/src/resources/satuanApiProvider.dart';
import 'package:aztira/src/resources/todoApiProvider.dart';
import 'package:aztira/src/resources/nodeApiProvider.dart';
import 'dart:async';
import '../models/satuanModel.dart';
import 'loginApiProvider.dart';

class Repository {
  final todoApiProvider = TodoApiProvider();
  final nodeApiProvider = NodeApiProvider();
  final satuanApiProvider = SatuanApiProvider();
  final userApiProvider = LoginApiProvider();
  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
  Future<List<Node>> fetchAllNode() => nodeApiProvider.fetchNodeList();
  Future<List<Satuan>> fetchAllSatuan() => satuanApiProvider.fetchSatuanList();
  Future<bool> fetchAllLogin(email, password) =>
      userApiProvider.fetchUserList(email, password);
}
