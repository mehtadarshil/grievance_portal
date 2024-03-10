import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/di/snackbar_util.dart';
import 'package:grievance_portal/app/models/my_profile_model.dart';
import 'package:grievance_portal/app/models/my_profile_update_model.dart';
import 'package:grievance_portal/utils/dbkeys.dart';

class MyProfileController extends GetxController {
  final ApiClient _apiClient = Get.find();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  void onReady() {
    getProfileDetails();
    super.onReady();
  }

  void getProfileDetails() async {
    var data = await _apiClient.put(
        path: ApiConst.wsGetUserDetailsById,
        formData: {ApiConst.userid: GetStorage().read(DbKeys.userId)});
    if (data != null) {
      MyProfileModel myProfileModel = MyProfileModel.fromJson(data);
      if (myProfileModel.status ?? false) {
        firstNameController.text = myProfileModel.data?.first.firstName ?? "";
        lastNameController.text = myProfileModel.data?.first.lastName ?? "";
        addressController.text = myProfileModel.data?.first.address ?? "";
        emailController.text = myProfileModel.data?.first.email ?? "";
        numberController.text = myProfileModel.data?.first.mobile ?? "";
      }
    }
  }

  void updateMyProfile() async {
    if (firstNameController.text.trim().isEmpty) {
      SnackBarUtil.showSnackBar(message: "please_enter_first_name".tr);
      return;
    } else if (lastNameController.text.trim().isEmpty) {
      SnackBarUtil.showSnackBar(message: "please_enter_last_name".tr);
      return;
    } else if (addressController.text.trim().isEmpty) {
      SnackBarUtil.showSnackBar(message: "please_enter_address".tr);
      return;
    }
    FormData formData = FormData.fromMap({
      ApiConst.userId: GetStorage().read(DbKeys.userId),
      ApiConst.firstName: firstNameController.text,
      ApiConst.lastName: lastNameController.text,
      ApiConst.address: addressController.text,
      ApiConst.email: emailController.text,
    });

    var data = await _apiClient.post(
        path: ApiConst.wsUpdateUserInformation, formData: formData);
    if (data != null) {
      MyProfileUpdateModel updateModel = MyProfileUpdateModel.fromJson(data);
      if (updateModel.status ?? false) {
        Get.back();
        SnackBarUtil.showSnackBar(message: updateModel.data?.message ?? "");
      }
    }
  }
}
