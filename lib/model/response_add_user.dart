// To parse this JSON data, do
//
//     final responseAddUser = responseAddUserFromJson(jsonString);

import 'dart:convert';

ResponseAddUser responseAddUserFromJson(String str) => ResponseAddUser.fromJson(json.decode(str));

String responseAddUserToJson(ResponseAddUser data) => json.encode(data.toJson());

class ResponseAddUser {
  String id;
  DateTime createdAt;

  ResponseAddUser({
    required this.id,
    required this.createdAt,
  });

  factory ResponseAddUser.fromJson(Map<String, dynamic> json) => ResponseAddUser(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
