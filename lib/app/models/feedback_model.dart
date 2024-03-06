// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) =>
    FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  final int? code;
  final bool? status;
  final List<String>? data;
  final DateTime? serverTime;

  FeedbackModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
        serverTime: json["server_time"] == null
            ? null
            : DateTime.parse(json["server_time"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "server_time": serverTime?.toIso8601String(),
      };
}
