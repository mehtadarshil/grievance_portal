// To parse this JSON data, do
//
//     final grievenceEmailHistoryModel = grievenceEmailHistoryModelFromJson(jsonString);

import 'dart:convert';

GrievenceEmailHistoryModel grievenceEmailHistoryModelFromJson(String str) =>
    GrievenceEmailHistoryModel.fromJson(json.decode(str));

String grievenceEmailHistoryModelToJson(GrievenceEmailHistoryModel data) =>
    json.encode(data.toJson());

class GrievenceEmailHistoryModel {
  final int? code;
  final bool? status;
  final List<Datum>? data;
  final DateTime? serverTime;

  GrievenceEmailHistoryModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory GrievenceEmailHistoryModel.fromJson(Map<String, dynamic> json) =>
      GrievenceEmailHistoryModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  final String? idEmailHistory;
  final String? subject;
  final String? emailStatusRemarks;
  final String? fromUser;
  final String? toUser;
  final String? sendBy;
  final DateTime? createdOn;

  Datum({
    this.idEmailHistory,
    this.subject,
    this.emailStatusRemarks,
    this.fromUser,
    this.toUser,
    this.sendBy,
    this.createdOn,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idEmailHistory: json["id_email_history"],
        subject: json["subject"],
        emailStatusRemarks: json["email_status_remarks"],
        fromUser: json["from_user"],
        toUser: json["to_user"],
        sendBy: json["send_by"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id_email_history": idEmailHistory,
        "subject": subject,
        "email_status_remarks": emailStatusRemarks,
        "from_user": fromUser,
        "to_user": toUser,
        "send_by": sendBy,
        "created_on": createdOn?.toIso8601String(),
      };
}
