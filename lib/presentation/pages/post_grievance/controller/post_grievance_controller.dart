import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/utils/logger.dart';

class PostGrievanceController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  RxBool isValid = false.obs;
  Rxn<PlatformFile> file = Rxn<PlatformFile>();

  void isValidCheck() {
    if (nameController.text.trim().isEmpty ||
        departmentController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        messageController.text.trim().isEmpty ||
        file.value == null ||
        isValid.isTrue) {
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
    }
  }
}
