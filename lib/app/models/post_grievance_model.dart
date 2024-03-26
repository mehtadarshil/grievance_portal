// To parse this JSON data, do
//
//     final postGrievanceModel = postGrievanceModelFromJson(jsonString);

import 'dart:convert';

PostGrievanceModel postGrievanceModelFromJson(String str) =>
    PostGrievanceModel.fromJson(json.decode(str));

String postGrievanceModelToJson(PostGrievanceModel data) =>
    json.encode(data.toJson());

class PostGrievanceModel {
  final int? code;
  final bool? status;
  final Data? data;
  final DateTime? serverTime;

  PostGrievanceModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory PostGrievanceModel.fromJson(Map<String, dynamic> json) =>
      PostGrievanceModel(
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
  final String? grievanceId;

  Data({
    this.grievanceId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        grievanceId: json["grievance_id"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "grievance_id": grievanceId,
      };
}
