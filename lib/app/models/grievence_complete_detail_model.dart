// To parse this JSON data, do
//
//     final grievenceCompleteDetailModel = grievenceCompleteDetailModelFromJson(jsonString);

import 'dart:convert';

GrievenceCompleteDetailModel grievenceCompleteDetailModelFromJson(String str) =>
    GrievenceCompleteDetailModel.fromJson(json.decode(str));

String grievenceCompleteDetailModelToJson(GrievenceCompleteDetailModel data) =>
    json.encode(data.toJson());

class GrievenceCompleteDetailModel {
  final int? code;
  final bool? status;
  final List<Datum>? data;
  final DateTime? serverTime;

  GrievenceCompleteDetailModel({
    this.code,
    this.status,
    this.data,
    this.serverTime,
  });

  factory GrievenceCompleteDetailModel.fromJson(Map<String, dynamic> json) =>
      GrievenceCompleteDetailModel(
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
  final String? customerName;
  final String? address;
  final String? departmentIds;
  final String? requestFile;
  final String? requestInitiatedBy;
  final String? department;
  final String? priority;
  final String? requestStatus;
  final String? requestPreviousStatus;
  final String? createdBy;
  final DateTime? createdOn;
  final DateTime? updatedOn;
  final String? remarks;
  final String? reportedBy;
  final dynamic reportedOn;
  final String? initialClientResponse;
  final String? requestDescription;
  final String? subject;
  final String? isTransferred;
  final String? transferredTo;
  final DateTime? transferDate;
  final String? transferReason;
  final String? grievanceAssignedTo;
  final DateTime? grievanceAssignedDate;
  final String? grievanceAssignDetails;
  final String? grievanceReassignedTo;
  final String? grievanceReassignReason;
  final String? departmentNames;
  final String? status;
  final dynamic priorityName;
  final String? firstName;
  final String? lastName;

  Datum({
    this.idRequest,
    this.uniqueRequestId,
    this.customerName,
    this.address,
    this.departmentIds,
    this.requestFile,
    this.requestInitiatedBy,
    this.department,
    this.priority,
    this.requestStatus,
    this.requestPreviousStatus,
    this.createdBy,
    this.createdOn,
    this.updatedOn,
    this.remarks,
    this.reportedBy,
    this.reportedOn,
    this.initialClientResponse,
    this.requestDescription,
    this.subject,
    this.isTransferred,
    this.transferredTo,
    this.transferDate,
    this.transferReason,
    this.grievanceAssignedTo,
    this.grievanceAssignedDate,
    this.grievanceAssignDetails,
    this.grievanceReassignedTo,
    this.grievanceReassignReason,
    this.departmentNames,
    this.status,
    this.priorityName,
    this.firstName,
    this.lastName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idRequest: json["id_request"],
        uniqueRequestId: json["unique_request_id"],
        customerName: json["customer_name"],
        address: json["address"],
        departmentIds: json["department_ids"],
        requestFile: json["request_file"],
        requestInitiatedBy: json["request_initiated_by"],
        department: json["department"],
        priority: json["priority"],
        requestStatus: json["request_status"],
        requestPreviousStatus: json["request_previous_status"],
        createdBy: json["created_by"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        remarks: json["remarks"],
        reportedBy: json["reported_by"],
        reportedOn: json["reported_on"],
        initialClientResponse: json["initial_client_response"],
        requestDescription: json["request_description"],
        subject: json["subject"],
        isTransferred: json["is_transferred"],
        transferredTo: json["transferred_to"],
        transferDate: json["transfer_date"] == null
            ? null
            : DateTime.parse(json["transfer_date"]),
        transferReason: json["transfer_reason"],
        grievanceAssignedTo: json["grievance_assigned_to"],
        grievanceAssignedDate: json["grievance_assigned_date"] == null
            ? null
            : DateTime.parse(json["grievance_assigned_date"]),
        grievanceAssignDetails: json["grievance_assign_details"],
        grievanceReassignedTo: json["grievance_reassigned_to"],
        grievanceReassignReason: json["grievance_reassign_reason"],
        departmentNames: json["department_names"],
        status: json["status"],
        priorityName: json["priority_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id_request": idRequest,
        "unique_request_id": uniqueRequestId,
        "customer_name": customerName,
        "address": address,
        "department_ids": departmentIds,
        "request_file": requestFile,
        "request_initiated_by": requestInitiatedBy,
        "department": department,
        "priority": priority,
        "request_status": requestStatus,
        "request_previous_status": requestPreviousStatus,
        "created_by": createdBy,
        "created_on": createdOn?.toIso8601String(),
        "updated_on": updatedOn?.toIso8601String(),
        "remarks": remarks,
        "reported_by": reportedBy,
        "reported_on": reportedOn,
        "initial_client_response": initialClientResponse,
        "request_description": requestDescription,
        "subject": subject,
        "is_transferred": isTransferred,
        "transferred_to": transferredTo,
        "transfer_date": transferDate?.toIso8601String(),
        "transfer_reason": transferReason,
        "grievance_assigned_to": grievanceAssignedTo,
        "grievance_assigned_date": grievanceAssignedDate?.toIso8601String(),
        "grievance_assign_details": grievanceAssignDetails,
        "grievance_reassigned_to": grievanceReassignedTo,
        "grievance_reassign_reason": grievanceReassignReason,
        "department_names": departmentNames,
        "status": status,
        "priority_name": priorityName,
        "first_name": firstName,
        "last_name": lastName,
      };
}
