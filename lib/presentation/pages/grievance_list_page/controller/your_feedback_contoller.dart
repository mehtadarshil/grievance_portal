import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/di/snackbar_util.dart';
import 'package:grievance_portal/app/models/feedback_list_model.dart';
import 'package:grievance_portal/app/models/feedback_model.dart';
import 'package:grievance_portal/utils/dbkeys.dart';
import 'package:grievance_portal/utils/dialog_util.dart';

import '../../../../app/models/grievance_detail_model.dart';

class YourFeedbackController extends GetxController {
  final Datum grievanceModel = Get.arguments;
  final ApiClient _apiClient = Get.find();

  RxString isSatisfied = "1".obs;
  TextEditingController feedbackController = TextEditingController();

  Rxn<FeedBackListModel> feedbackList = Rxn<FeedBackListModel>();

  @override
  void onReady() {
    getFeedBackList();
    super.onReady();
  }

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
        path: ApiConst.wssaveusergrievancefeedback, formData: formData);
    if (postGrievanceJson != null) {
      FeedbackModel postGrievanceModel =
          FeedbackModel.fromJson(postGrievanceJson);
      if (postGrievanceModel.status! &&
          postGrievanceModel.data != null &&
          postGrievanceModel.data!.length == 2) {
        DialogUtil.customDialog(
          title: postGrievanceModel.data?.elementAt(1) ?? "",
          onDone: () {
            Get.close(2);
          },
        );
      }
    }
  }

  void getFeedBackList() async {
    var data = await _apiClient.put(
        path: ApiConst.wsGetFeedbackbyGrivanceId,
        formData: {ApiConst.grievanceId: grievanceModel.idRequest ?? ""});
    if (data != null) {
      FeedBackListModel feedBackListModel = FeedBackListModel.fromJson(data);
      if (feedBackListModel.status ?? false) {
        feedbackList.value = feedBackListModel;
      }
    }
  }
}
