import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/di/snackbar_util.dart';
import 'package:grievance_portal/app/models/user_data.dart';
import 'package:grievance_portal/app/models/user_details.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/utils/dbkeys.dart';
import 'package:grievance_portal/utils/dialog_util.dart';

class LogInController extends GetxController {
  final ApiClient _apiClient = Get.find();
  final TextEditingController numberController = TextEditingController();
  RxBool isValid = false.obs;

  void logIn() async {
    if (numberController.text.trim().length != 10) {
      SnackBarUtil.showSnackBar(message: "please_enter_proper_number".tr);
      return;
    }
    var registerJson = await _apiClient.put(
        path: ApiConst.wsRegisteruser,
        formData: {ApiConst.mobileno: numberController.text});
    if (registerJson != null) {
      UserData userData = UserData.fromJson(registerJson);
      if (userData.status!) {
        GetStorage().write(DbKeys.userId, userData.data?.userId);
        DialogUtil.verifiedDialog();
      } else {
        var loginJson = await _apiClient.put(
            path: ApiConst.wsGetUserDetailsByMobile,
            formData: {ApiConst.mobileno: numberController.text});
        if (loginJson != null) {
          UserDetails userDetails = UserDetails.fromJson(loginJson);
          await GetStorage()
              .write(DbKeys.userId, userDetails.data?.first.idUser);
          // DialogUtil.verifiedDialog();
          Get.until((route) => route.settings.name == RouteList.homePage);
          Get.toNamed(RouteList.postGrievancePage);
        }
      }
    }
  }
}
