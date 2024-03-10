// To parse this JSON data, do
//
//     final myProfileUpdateModel = myProfileUpdateModelFromJson(jsonString);

import 'dart:convert';

MyProfileUpdateModel myProfileUpdateModelFromJson(String str) =>
    MyProfileUpdateModel.fromJson(json.decode(str));

String myProfileUpdateModelToJson(MyProfileUpdateModel data) =>
    json.encode(data.toJson());

class MyProfileUpdateModel {
  final int? code;
  final bool? status;
  final Data? data;
  final DateTime? serverTime;

  MyProfileUpdateModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory MyProfileUpdateModel.fromJson(Map<String, dynamic> json) =>
      MyProfileUpdateModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        serverTime: json["server_time"] == null
            ? null
            : DateTime.parse(json["server_time"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
        "server_time": serverTime?.toIso8601String(),
      };
}

class Data {
  final String? message;

  Data({
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
