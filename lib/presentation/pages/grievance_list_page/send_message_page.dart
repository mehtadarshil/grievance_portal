import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/send_message_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_textfield.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class SendMessagePage extends GetView<SendMessageController> {
  const SendMessagePage({super.key});

  @override
  SendMessageController get controller => Get.put(SendMessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar(title: "Send_Message".tr),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextField(
                  hintText: "Enter_your_subject".tr,
                  title: "Subject".tr,
                  focusNode: controller.focusNode,
                  onTapOutSide: (p0) {
                    controller.focusNode.unfocus();
                  },
                  controller: controller.subjectController),
              const SizedBox(
                height: 30,
              ),
              Opacity(
                opacity: 0.6,
                child: Text(
                  "Message_field".tr,
                  style: const TextStyle(
                      fontFamily: FontFamily.urbanistMedium, fontSize: 16),
                ),
              ).paddingOnly(bottom: 11),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: QuillHtmlEditor(
                  editorKey: controller.htmlKey,
                  height: 350,
                  hintText: "Enter_your_message".tr,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CommonButton(
                text: "Send".tr,
                onTap: () {
                  controller.sendMessage();
                },
              )
            ],
          ).paddingAll(20),
        ));
  }
}
