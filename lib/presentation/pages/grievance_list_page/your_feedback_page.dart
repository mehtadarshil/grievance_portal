import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/your_feedback_contoller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_textfield.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:intl/intl.dart';

class YourFeedBackPage extends GetView<YourFeedbackController> {
  const YourFeedBackPage({super.key});

  @override
  YourFeedbackController get controller => Get.put(YourFeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
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
            ).paddingOnly(bottom: 30),
            Text(
              "your_feedback".tr,
              style: const TextStyle(
                  fontFamily: FontFamily.urbanistSemiBold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => controller.feedbackList.value != null
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.feedbackList.value!.data!.length,
                      itemBuilder: (context, index) {
                        var data = controller.feedbackList.value!.data![index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.headerColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  data.isSatisfied == "2"
                                      ? "disSatisfied".tr
                                      : "satisfied".tr,
                                  style: const TextStyle(
                                      fontFamily: FontFamily.urbanistBold,
                                      fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "${"feedback".tr}: ",
                                    style: const TextStyle(
                                        fontFamily: FontFamily.urbanistSemiBold,
                                        fontSize: 13)),
                                TextSpan(
                                    text: data.userFeedback ?? "",
                                    style: const TextStyle(
                                        fontFamily: FontFamily.urbanistRegular,
                                        fontSize: 13))
                              ])),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "${"Date_Created".tr}: ",
                                    style: const TextStyle(
                                        fontFamily: FontFamily.urbanistSemiBold,
                                        fontSize: 13)),
                                TextSpan(
                                    text: DateFormat("dd MMM,yyyy hh:mm:aa")
                                        .format(data.dateCreated!),
                                    style: const TextStyle(
                                        fontFamily: FontFamily.urbanistRegular,
                                        fontSize: 13))
                              ]))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 20),
      ),
    );
  }
}
