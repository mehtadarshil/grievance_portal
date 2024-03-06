// To parse this JSON data, do
//
//     final reOpenModel = reOpenModelFromJson(jsonString);

import 'dart:convert';

ReOpenModel reOpenModelFromJson(String str) =>
    ReOpenModel.fromJson(json.decode(str));

String reOpenModelToJson(ReOpenModel data) => json.encode(data.toJson());

class ReOpenModel {
  final int? code;
  final bool? status;
  final Data? data;
  final DateTime? serverTime;

  ReOpenModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory ReOpenModel.fromJson(Map<String, dynamic> json) => ReOpenModel(
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
