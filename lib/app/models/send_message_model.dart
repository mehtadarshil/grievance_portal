// To parse this JSON data, do
//
//     final sendMessageModel = sendMessageModelFromJson(jsonString);

import 'dart:convert';

SendMessageModel sendMessageModelFromJson(String str) =>
    SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) =>
    json.encode(data.toJson());

class SendMessageModel {
  final int? code;
  final bool? status;
  final String? data;
  final DateTime? serverTime;

  SendMessageModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        code: json["code"],
        status: json["status"],
        data: json["data"],
        serverTime: json["server_time"] == null
            ? null
            : DateTime.parse(json["server_time"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data,
        "server_time": serverTime?.toIso8601String(),
      };
}
