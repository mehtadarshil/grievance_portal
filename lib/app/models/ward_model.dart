// To parse this JSON data, do
//
//     final wardModel = wardModelFromJson(jsonString);

import 'dart:convert';

WardModel wardModelFromJson(String str) => WardModel.fromJson(json.decode(str));

String wardModelToJson(WardModel data) => json.encode(data.toJson());

class WardModel {
  final int? code;
  final bool? status;
  final List<Datum>? data;
  final DateTime? serverTime;

  WardModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory WardModel.fromJson(Map<String, dynamic> json) => WardModel(
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
  final String? idGpward;
  final String? gpwardName;
  final String? gpwardNameOdia;
  final DateTime? createdOn;

  Datum({
    this.idGpward,
    this.gpwardName,
    this.gpwardNameOdia,
    this.createdOn,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idGpward: json["id_gpward"],
        gpwardName: json["gpward_name"],
        gpwardNameOdia: json["gpward_name_odia"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id_gpward": idGpward,
        "gpward_name": gpwardName,
        "gpward_name_odia": gpwardNameOdia,
        "created_on": createdOn?.toIso8601String(),
      };
}
