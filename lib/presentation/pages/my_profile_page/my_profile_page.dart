import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/my_profile_page/controller/my_profile_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_textfield.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class MyProfilePage extends GetView<MyProfileController> {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "my_profile".tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonTextField(
              controller: controller.firstNameController,
              hintText: 'first_name'.tr,
              title: "first_name".tr,
            ).paddingOnly(bottom: 32),
            CommonTextField(
              controller: controller.lastNameController,
              hintText: 'last_name'.tr,
              title: "last_name".tr,
            ).paddingOnly(bottom: 32),
            CommonTextField(
              controller: controller.addressController,
              hintText: 'Address'.tr,
              title: "Address".tr,
            ).paddingOnly(bottom: 32),
            CommonTextField(
              controller: controller.emailController,
              hintText: 'email'.tr,
              title: "email".tr,
            ).paddingOnly(bottom: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextField(
                  controller: controller.numberController,
                  hintText: 'mobile_no'.tr,
                  title: "mobile_no".tr,
                  onTap: () {},
                ),
                Text(
                  "cannot_be_edited".tr,
                  style: TextStyle(
                      fontFamily: FontFamily.urbanistSemiBold,
                      fontSize: 14,
                      color: AppColors.blackColor.withOpacity(0.6)),
                )
              ],
            ).paddingOnly(bottom: 50),
            CommonButton(
                text: "Submit".tr,
                onTap: () {
                  controller.updateMyProfile();
                })
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 20),
      ),
    );
  }
}
