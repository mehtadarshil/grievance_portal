// To parse this JSON data, do
//
//     final totalGrievance = totalGrievanceFromJson(jsonString);

import 'dart:convert';

TotalGrievanceModel totalGrievanceFromJson(String str) =>
    TotalGrievanceModel.fromJson(json.decode(str));

String totalGrievanceToJson(TotalGrievanceModel data) =>
    json.encode(data.toJson());

class TotalGrievanceModel {
  final int? code;
  final bool? status;
  final Data? data;
  final DateTime? serverTime;

  TotalGrievanceModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory TotalGrievanceModel.fromJson(Map<String, dynamic> json) =>
      TotalGrievanceModel(
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
  final int? totalUserRequests;

  Data({
    this.totalUserRequests,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalUserRequests: json["total_user_requests"],
      );

  Map<String, dynamic> toJson() => {
        "total_user_requests": totalUserRequests,
      };
}
