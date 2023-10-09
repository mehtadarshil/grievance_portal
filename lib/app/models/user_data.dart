// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  final int? code;
  final bool? status;
  final Data? data;
  final String? message;
  final DateTime? serverTime;

  UserData({
    this.code,
    this.status,
    this.data,
    this.message,
    this.serverTime,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        serverTime: json["server_time"] == null
            ? null
            : DateTime.parse(json["server_time"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
        "message": message,
        "server_time": serverTime?.toIso8601String(),
      };
}

class Data {
  final int? userId;

  Data({
    this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}
