import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/models/department_model.dart';
import 'package:grievance_portal/app/models/post_grievance_model.dart';
import 'package:grievance_portal/utils/dialog_util.dart';
import 'package:grievance_portal/utils/logger.dart';

class PostGrievanceController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final ApiClient _apiClient = Get.find();
  RxBool isValid = false.obs;
  RxString selectedDepartmentId = ''.obs;
  String tempDepartmentName = '';
  String tempDepartmentId = '';
  Rxn<PlatformFile> file = Rxn<PlatformFile>();
  Rxn<DepartmentModel> departmentModel = Rxn<DepartmentModel>();

  @override
  void onReady() {
    getDepartments();
    super.onReady();
  }

  void isValidCheck() {
    if (nameController.text.trim().isEmpty ||
        departmentController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        messageController.text.trim().isEmpty ||
        file.value == null) {
      isValid(false);
    } else if (isValid.isFalse) {
      isValid(true);
    }
  }

  void pickUpFile() async {
    var pickedFile = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (pickedFile != null) {
      file.value = pickedFile.files.first;
      Logger.prints(file.value?.name);
      isValidCheck();
    }
  }

  void getDepartments() async {
    var departJson = await _apiClient.get(path: ApiConst.wsGetDepartments);
    if (departJson != null) {
      departmentModel.value = DepartmentModel.fromJson(departJson);
      selectedDepartmentId.value =
          departmentModel.value!.data!.first.idDepartment!;
      tempDepartmentId = departmentModel.value!.data!.first.idDepartment!;
      tempDepartmentName = departmentModel.value!.data!.first.departmentName!;
    }
  }

  void postGrievance() async {
    FormData formData = FormData.fromMap({
      ApiConst.userId: 1,
      ApiConst.customerName: nameController.text,
      ApiConst.departmentId: tempDepartmentId,
      ApiConst.requestDescription: messageController.text,
      ApiConst.address: addressController.text,
    });
    formData.files.add(MapEntry(
        ApiConst.requestFile,
        await MultipartFile.fromFile(file.value!.path!,
            filename: file.value?.name ?? "")));
    var postGrievanceJson = await _apiClient.post(
        path: ApiConst.wsSaveGrievanceRequest, formData: formData);
    if (postGrievanceJson != null) {
      PostGrievanceModel postGrievanceModel =
          PostGrievanceModel.fromJson(postGrievanceJson);
      if (postGrievanceModel.status!) {
        DialogUtil.postGrievanceThankYouDialog();
      }
    }
  }
}
