// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

User todoFromJson(Map<String, dynamic> json) =>
    User.from(json["data"].map((x) => User.fromJson(x)));

String todoToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.username,
    this.fullname,
  });

  String id;
  String username;
  String fullname;

  // factory Todo.fromJson(Map<String, dynamic> json) {
  //   return new Todo(
  //     id: json['_id'],
  //   );
  // }

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"], username: json["username"], fullname: json["full_name"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "username": username, "full_name": fullname};

  static from(map) {}
}
