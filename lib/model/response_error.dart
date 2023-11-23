// To parse this JSON data, do
//
//     final responseError = responseErrorFromJson(jsonString);

import 'dart:convert';

ResponseError responseErrorFromJson(var str) => ResponseError.fromJson(str);

String responseErrorToJson(ResponseError data) => json.encode(data.toJson());

class ResponseError {
  ResponseError({
    required this.status,
    required this.message,
    this.data,
  });

  bool status;
  String message;
  dynamic data;

  factory ResponseError.fromJson(Map<String, dynamic> json) => ResponseError(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
