// To parse this JSON data, do
//
//     final feedBackListModel = feedBackListModelFromJson(jsonString);

import 'dart:convert';

FeedBackListModel feedBackListModelFromJson(String str) =>
    FeedBackListModel.fromJson(json.decode(str));

String feedBackListModelToJson(FeedBackListModel data) =>
    json.encode(data.toJson());

class FeedBackListModel {
  final int? code;
  final bool? status;
  final List<FeedbackData>? data;
  final DateTime? serverTime;

  FeedBackListModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory FeedBackListModel.fromJson(Map<String, dynamic> json) =>
      FeedBackListModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<FeedbackData>.from(
                json["data"]!.map((x) => FeedbackData.fromJson(x))),
        serverTime: json["server_time"] == null
            ? null
            : DateTime.parse(json["server_time"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "server_time": serverTime?.toIso8601String(),
      };
}

class FeedbackData {
  final String? idUserFeedback;
  final String? grievanceId;
  final String? isSatisfied;
  final String? userFeedback;
  final DateTime? dateCreated;

  FeedbackData({
    this.idUserFeedback,
    this.grievanceId,
    this.isSatisfied,
    this.userFeedback,
    this.dateCreated,
  });

  factory FeedbackData.fromJson(Map<String, dynamic> json) => FeedbackData(
        idUserFeedback: json["id_user_feedback"],
        grievanceId: json["grievance_id"],
        isSatisfied: json["is_satisfied"],
        userFeedback: json["user_feedback"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user_feedback": idUserFeedback,
        "grievance_id": grievanceId,
        "is_satisfied": isSatisfied,
        "user_feedback": userFeedback,
        "date_created": dateCreated?.toIso8601String(),
      };
}
