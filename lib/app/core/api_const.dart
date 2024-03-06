class ApiConst {
  static const baseUrl =
      "https://home.arrowleaf.solutions/grievanceapi/frontwebend/";
  static const apiKeyValue = "CODEX@123";
  static const wsRegisteruser = "registeruser";
  static const wsGetUserDetailsByMobile = "getuserdetailsbymobile";
  static const wsGetDepartments = 'getdepartments';
  static const wsGetgpWards = "getgpwards";
  static const wsGetVillageBygpWard = "getvillagebygpward";
  static const wsSaveGrievanceRequest = "savegrievancerequest";
  static const wsGetTotalRequestsByUser = "gettotalrequestsbyuser";
  static const wsGetUserGrievanceList = "getusergrievancelist";
  static const wsGetGrievanceHistoryByGrievanceid =
      "getgrievancehistorybygrievanceid";
  static const wsGetGrievanceEmailHistoryByUser =
      "getgrievanceemailhistorybyuser";
  static const wsGetGrievanceDetailsById = "getgrievancedetailsbyid";
  static const wsSendUserGrievanceMessage = "sendusergrievancemessage";
  static const wsReopenuserGrievance = "reopenusergrievance";

  //const tags
  static const authorization = "Authorization";
  static const apiKey = "X-API-KEY";
  static const mobileno = "mobileno";
  static const userId = "user_id";
  static const customerName = "customer_name";
  static const departmentId = "department_id";
  static const requestDescription = "request_description";
  static const address = "address";
  static const requestFile = "request_file";
  static const grievanceId = "grievance_id";
  static const subject = "subject";
  static const userMessage = "user_message";
  static const gpwardId = "gpward_id";
  static const villageId = "village_id";
  static const grievanceFromDevice = "grievance_from_device";
  static const grievancePreviousStatus = "grievance_previous_status";
  static const reopenDetails = "reopen_details";
  static const requestImage = "request_image";
}
