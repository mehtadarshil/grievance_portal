import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/log_in_page/controller/log_in_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_textfield.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class LogInPage extends GetView<LogInController> {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CommonAppbar(
        title: "Log_In".tr,
        subTitle: "Verify_your_Mobile_Number".tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.login.image(height: 212, width: 212),
              ],
            ).paddingSymmetric(vertical: 62),
            Text(
              "Phone_Number".tr,
              style: const TextStyle(
                  fontFamily: FontFamily.urbanistBold, fontSize: 20),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Container(
                  width: 88,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "🇮🇳",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: AppColors.textColor.withOpacity(0.3),
                        size: 30,
                      )
                    ],
                  ).paddingOnly(left: 16, right: 5),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: CommonTextField(
                      hintText: "Phone_Number".tr,
                      textInputType: TextInputType.number,
                      controller: controller.numberController),
                )
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            CommonButton(
                text: "Submit".tr,
                onTap: () {
                  controller.logIn();
                }).paddingOnly(bottom: 26),
            CommonButton(
              color: Colors.transparent,
              textColor: AppColors.blackColor,
              text: "Back".tr,
              onTap: () {
                Get.back();
              },
            )
          ],
        ).paddingSymmetric(horizontal: 21),
      ),
    );
  }
}
