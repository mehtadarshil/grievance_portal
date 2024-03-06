import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/di/snackbar_util.dart';
import 'package:grievance_portal/app/models/reopen_model.dart';
import 'package:grievance_portal/utils/dbkeys.dart';
import 'package:grievance_portal/utils/dialog_util.dart';
import 'package:grievance_portal/utils/logger.dart';

import '../../../../app/models/grievance_detail_model.dart';

class ReOpenGrievanceController extends GetxController {
  final Datum grievanceModel = Get.arguments;
  final ApiClient _apiClient = Get.find();
  Rxn<PlatformFile> file = Rxn<PlatformFile>();
  final TextEditingController reOpenReasonController = TextEditingController();

  void reOpenGrievance() async {
    if (reOpenReasonController.text.trim().isEmpty) {
      SnackBarUtil.showSnackBar(message: "Please_enter_reopen_reason".tr);
      return;
    }
    FormData formData = FormData.fromMap({
      ApiConst.userId: GetStorage().read(DbKeys.userId),
      ApiConst.grievanceId: grievanceModel.idRequest,
      ApiConst.grievancePreviousStatus: grievanceModel.requestStatus,
      ApiConst.reopenDetails: reOpenReasonController.text,
    });
    if (file.value != null) {
      formData.files.add(MapEntry(
          ApiConst.requestImage,
          await MultipartFile.fromFile(file.value!.path!,
              filename: file.value?.name ?? "")));
    }

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

  void pickUpFile() async {
    var pickedFile = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (pickedFile != null) {
      file.value = pickedFile.files.first;
      Logger.prints(file.value?.name);
    }
  }
}
