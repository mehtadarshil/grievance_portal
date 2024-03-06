import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/di/snackbar_util.dart';
import 'package:grievance_portal/app/models/reopen_model.dart';
import 'package:grievance_portal/utils/dbkeys.dart';
import 'package:grievance_portal/utils/dialog_util.dart';

import '../../../../app/models/grievance_detail_model.dart';

class YourFeedbackController extends GetxController {
  final Datum grievanceModel = Get.arguments;
  final ApiClient _apiClient = Get.find();

  RxString isSatisfied = "1".obs;
  TextEditingController feedbackController = TextEditingController();

  void giveFeedback() async {
    if (feedbackController.text.trim().isEmpty) {
      SnackBarUtil.showSnackBar(message: "please_enter_your_feedback".tr);
      return;
    }
    FormData formData = FormData.fromMap({
      ApiConst.userId: GetStorage().read(DbKeys.userId),
      ApiConst.grievanceId: grievanceModel.idRequest,
      ApiConst.isSatisfied: isSatisfied.value,
      ApiConst.yourFeedback: feedbackController.text,
    });

    var postGrievanceJson = await _apiClient.post(
        path: ApiConst.wsReopenuserGrievance, formData: formData);
    if (postGrievanceJson != null) {
      ReOpenModel postGrievanceModel = ReOpenModel.fromJson(postGrievanceJson);
      if (postGrievanceModel.status!) {
        DialogUtil.customDialog(
          title: postGrievanceModel.data?.message ?? "",
          onDone: () {
            Get.close(2);
          },
        );
      }
    }
  }
}
