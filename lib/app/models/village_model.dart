// To parse this JSON data, do
//
//     final villageModel = villageModelFromJson(jsonString);

import 'dart:convert';

VillageModel villageModelFromJson(String str) =>
    VillageModel.fromJson(json.decode(str));

String villageModelToJson(VillageModel data) => json.encode(data.toJson());

class VillageModel {
  final int? code;
  final bool? status;
  final List<Datum>? data;
  final DateTime? serverTime;

  VillageModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory VillageModel.fromJson(Map<String, dynamic> json) => VillageModel(
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
  final String? idVillage;
  final String? villageName;
  final String? villageNameOdia;
  final DateTime? createdOn;

  Datum({
    this.idVillage,
    this.villageName,
    this.villageNameOdia,
    this.createdOn,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idVillage: json["id_village"],
        villageName: json["village_name"],
        villageNameOdia: json["village_name_odia"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id_village": idVillage,
        "village_name": villageName,
        "village_name_odia": villageNameOdia,
        "created_on": createdOn?.toIso8601String(),
      };
}
