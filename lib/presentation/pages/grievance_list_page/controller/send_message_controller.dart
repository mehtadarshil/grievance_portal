import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/models/send_message_model.dart';
import 'package:grievance_portal/utils/dbkeys.dart';
import 'package:grievance_portal/utils/dialog_util.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class SendMessageController extends GetxController {
  final ApiClient _apiClient = Get.find();
  final String grievenceId = Get.arguments;
  final htmlKey = GlobalKey<QuillHtmlEditorState>();
  final TextEditingController subjectController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void sendMessage() async {
    var htmlText = await htmlKey.currentState?.getText();
    var formated = htmlText!.replaceAll("\\u", "").replaceAll("003C", "<");
    if (formated == "<p><br></p>") {
      DialogUtil.customDialog(title: "enter_proper_message".tr, error: true);
    } else if (subjectController.text.isEmpty) {
      DialogUtil.customDialog(title: "enter_proper_subject".tr, error: true);
    } else {
      var sendMessageJson = await _apiClient
          .put(path: ApiConst.wsSendUserGrievanceMessage, formData: {
        ApiConst.grievanceId: grievenceId,
        ApiConst.userId: GetStorage().read(DbKeys.userId),
        ApiConst.subject: subjectController.text,
        ApiConst.userMessage: formated
      });
      if (sendMessageJson != null) {
        SendMessageModel sendMessageModel =
            SendMessageModel.fromJson(sendMessageJson);
        if (sendMessageModel.status!) {
          DialogUtil.customDialog(
            title: "Message_sent_successfully".tr,
            onDone: () {
              Get.close(2);
            },
          );
        } else {
          DialogUtil.customDialog(title: "Failed".tr, error: true);
        }
      }
    }
  }
}
