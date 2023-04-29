// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Satuan> todoFromJson(Map<String, dynamic> json) =>
    List<Satuan>.from(json["data"].map((x) => Satuan.fromJson(x)));

String todoToJson(List<Satuan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Satuan {
  Satuan({
    this.id,
    this.name,
    this.symbol,
    this.v,
  });

  String id;
  String name;
  String symbol;
  String v;

  // factory Todo.fromJson(Map<String, dynamic> json) {
  //   return new Todo(
  //     id: json['_id'],
  //   );
  // }

  factory Satuan.fromJson(Map<String, dynamic> json) => Satuan(
        id: json["_id"],
        name: json["name"],
        symbol: json["symbol"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "symbol": symbol,
        "__v": v,
      };
}
