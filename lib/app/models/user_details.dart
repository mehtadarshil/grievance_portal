// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  final int? code;
  final bool? status;
  final List<Datum>? data;
  final DateTime? serverTime;

  UserDetails({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
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
  final String? idUser;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final String? address;
  final String? userStatus;
  final DateTime? dateRegistered;

  Datum({
    this.idUser,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.address,
    this.userStatus,
    this.dateRegistered,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idUser: json["id_user"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        userStatus: json["user_status"],
        dateRegistered: json["date_registered"] == null
            ? null
            : DateTime.parse(json["date_registered"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "address": address,
        "user_status": userStatus,
        "date_registered": dateRegistered?.toIso8601String(),
      };
}
