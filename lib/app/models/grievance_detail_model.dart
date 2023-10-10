// To parse this JSON data, do
//
//     final grievanceDetails = grievanceDetailsFromJson(jsonString);

import 'dart:convert';

GrievanceDetails grievanceDetailsFromJson(String str) =>
    GrievanceDetails.fromJson(json.decode(str));

String grievanceDetailsToJson(GrievanceDetails data) =>
    json.encode(data.toJson());

class GrievanceDetails {
  final int? code;
  final bool? status;
  final List<Datum>? data;
  final DateTime? serverTime;

  GrievanceDetails({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory GrievanceDetails.fromJson(Map<String, dynamic> json) =>
      GrievanceDetails(
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
  final String? idRequest;
  final String? uniqueRequestId;
  final String? department;
  final String? requestStatus;
  final DateTime? createdOn;
  final DateTime? updatedOn;
  final String? remarks;
  final String? requestDescription;
  final DateTime? updatedStatusDate;
  final String? status;
  final String? departmentNames;
  final String? customerName;
  final String? address;
  final List<RequestStatusArray>? requestStatusArray;
  final List<dynamic>? latestRequestEmailstatusArray;
  final List<dynamic>? requestEmailstatusArray;
  final List<RequestFileArray>? requestFileArray;

  Datum({
    this.idRequest,
    this.uniqueRequestId,
    this.department,
    this.requestStatus,
    this.createdOn,
    this.updatedOn,
    this.remarks,
    this.requestDescription,
    this.updatedStatusDate,
    this.status,
    this.departmentNames,
    this.customerName,
    this.address,
    this.requestStatusArray,
    this.latestRequestEmailstatusArray,
    this.requestEmailstatusArray,
    this.requestFileArray,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idRequest: json["id_request"],
        uniqueRequestId: json["unique_request_id"],
        department: json["department"],
        requestStatus: json["request_status"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        remarks: json["remarks"],
        requestDescription: json["request_description"],
        updatedStatusDate: json["updated_status_date"] == null
            ? null
            : DateTime.parse(json["updated_status_date"]),
        status: json["status"],
        departmentNames: json["department_names"],
        customerName: json["customer_name"],
        address: json["address"],
        requestStatusArray: json["request_status_array"] == null
            ? []
            : List<RequestStatusArray>.from(json["request_status_array"]!
                .map((x) => RequestStatusArray.fromJson(x))),
        latestRequestEmailstatusArray:
            json["latest_request_emailstatus_array"] == null
                ? []
                : List<dynamic>.from(
                    json["latest_request_emailstatus_array"]!.map((x) => x)),
        requestEmailstatusArray: json["request_emailstatus_array"] == null
            ? []
            : List<dynamic>.from(
                json["request_emailstatus_array"]!.map((x) => x)),
        requestFileArray: json["request_file_array"] == null
            ? []
            : List<RequestFileArray>.from(json["request_file_array"]!
                .map((x) => RequestFileArray.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_request": idRequest,
        "unique_request_id": uniqueRequestId,
        "department": department,
        "request_status": requestStatus,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "remarks": remarks,
        "request_description": requestDescription,
        "updated_status_date": updatedStatusDate?.toIso8601String(),
        "status": status,
        "department_names": departmentNames,
        "customer_name": customerName,
        "address": address,
        "request_status_array": requestStatusArray == null
            ? []
            : List<dynamic>.from(requestStatusArray!.map((x) => x.toJson())),
        "latest_request_emailstatus_array": latestRequestEmailstatusArray ==
                null
            ? []
            : List<dynamic>.from(latestRequestEmailstatusArray!.map((x) => x)),
        "request_emailstatus_array": requestEmailstatusArray == null
            ? []
            : List<dynamic>.from(requestEmailstatusArray!.map((x) => x)),
        "request_file_array": requestFileArray == null
            ? []
            : List<dynamic>.from(requestFileArray!.map((x) => x.toJson())),
      };
}

class RequestFileArray {
  final String? requestImageId;
  final String? requestImageName;
  final String? requestImagePath;

  RequestFileArray({
    this.requestImageId,
    this.requestImageName,
    this.requestImagePath,
  });

  factory RequestFileArray.fromJson(Map<String, dynamic> json) =>
      RequestFileArray(
        requestImageId: json["request_image_id"],
        requestImageName: json["request_image_name"],
        requestImagePath: json["request_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "request_image_id": requestImageId,
        "request_image_name": requestImageName,
        "request_image_path": requestImagePath,
      };
}

class RequestStatusArray {
  final String? idStatusHistory;
  final String? requestStatus;
  final String? remarks;
  final String? isTransferred;
  final dynamic transferDate;
  final String? transferReason;
  final String? grievanceAssignedTo;
  final dynamic grievanceAssignedDate;
  final String? isViewed;
  final String? requestStatusFile;
  final String? originalImagePath;
  final String? thumbImagePath;
  final String? grievanceAssignDetails;
  final String? grievanceReassignedTo;
  final dynamic grievanceReassignedDate;
  final String? createdByUserid;
  final String? grievanceReassignReason;
  final String? createdBy;
  final DateTime? createdOn;
  final String? status;

  RequestStatusArray({
    this.idStatusHistory,
    this.requestStatus,
    this.remarks,
    this.isTransferred,
    this.transferDate,
    this.transferReason,
    this.grievanceAssignedTo,
    this.grievanceAssignedDate,
    this.isViewed,
    this.requestStatusFile,
    this.originalImagePath,
    this.thumbImagePath,
    this.grievanceAssignDetails,
    this.grievanceReassignedTo,
    this.grievanceReassignedDate,
    this.createdByUserid,
    this.grievanceReassignReason,
    this.createdBy,
    this.createdOn,
    this.status,
  });

  factory RequestStatusArray.fromJson(Map<String, dynamic> json) =>
      RequestStatusArray(
        idStatusHistory: json["id_status_history"],
        requestStatus: json["request_status"],
        remarks: json["remarks"],
        isTransferred: json["is_transferred"],
        transferDate: json["transfer_date"],
        transferReason: json["transfer_reason"],
        grievanceAssignedTo: json["grievance_assigned_to"],
        grievanceAssignedDate: json["grievance_assigned_date"],
        isViewed: json["is_viewed"],
        requestStatusFile: json["request_status_file"],
        originalImagePath: json["original_image_path"],
        thumbImagePath: json["thumb_image_path"],
        grievanceAssignDetails: json["grievance_assign_details"],
        grievanceReassignedTo: json["grievance_reassigned_to"],
        grievanceReassignedDate: json["grievance_reassigned_date"],
        createdByUserid: json["created_by_userid"],
        grievanceReassignReason: json["grievance_reassign_reason"],
        createdBy: json["created_by"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_status_history": idStatusHistory,
        "request_status": requestStatus,
        "remarks": remarks,
        "is_transferred": isTransferred,
        "transfer_date": transferDate,
        "transfer_reason": transferReason,
        "grievance_assigned_to": grievanceAssignedTo,
        "grievance_assigned_date": grievanceAssignedDate,
        "is_viewed": isViewed,
        "request_status_file": requestStatusFile,
        "original_image_path": originalImagePath,
        "thumb_image_path": thumbImagePath,
        "grievance_assign_details": grievanceAssignDetails,
        "grievance_reassigned_to": grievanceReassignedTo,
        "grievance_reassigned_date": grievanceReassignedDate,
        "created_by_userid": createdByUserid,
        "grievance_reassign_reason": grievanceReassignReason,
        "created_by": createdBy,
        "created_on": createdOn?.toIso8601String(),
        "status": status,
      };
}
