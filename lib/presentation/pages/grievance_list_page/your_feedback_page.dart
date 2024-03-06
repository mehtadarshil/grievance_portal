import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/your_feedback_contoller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_textfield.dart';

class YourFeedBackPage extends GetView<YourFeedbackController> {
  const YourFeedBackPage({super.key});

  @override
  YourFeedbackController get controller => Get.put(YourFeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Send_us_your_feedback".tr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.6,
              child: Text(
                "are_you_satisfied".tr,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistMedium, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => RadioListTile(
                      value: "1",
                      groupValue: controller.isSatisfied.value,
                      onChanged: (value) {
                        controller.isSatisfied.value = value ?? "";
                      },
                      title: const Text(
                        "Yes",
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => RadioListTile(
                      value: "2",
                      groupValue: controller.isSatisfied.value,
                      onChanged: (value) {
                        controller.isSatisfied.value = value ?? "";
                      },
                      title: const Text(
                        "No",
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ).paddingOnly(bottom: 30),
            CommonTextField(
                    title: "Your Feedback",
                    hintText: "Enter Here",
                    maxLines: 5,
                    controller: controller.feedbackController)
                .paddingOnly(bottom: 50),
            CommonButton(
              text: "Submit".tr,
              onTap: () {
                controller.giveFeedback();
              },
            )
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 20),
      ),
    );
  }
}
