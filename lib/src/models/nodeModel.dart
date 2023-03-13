// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Node> todoFromJson(Map<String, dynamic> json) =>
    List<Node>.from(json["data"].map((x) => Node.fromJson(x)));

String todoToJson(List<Node> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Node {
  Node({
    this.id,
    this.name,
    this.done,
    this.v,
  });

  String id;
  String name;
  String done;
  String v;

  // factory Todo.fromJson(Map<String, dynamic> json) {
  //   return new Todo(
  //     id: json['_id'],
  //   );
  // }

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["_id"],
        name: json["name"],
        done: json["done"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "done": done,
        "__v": v,
      };
}
