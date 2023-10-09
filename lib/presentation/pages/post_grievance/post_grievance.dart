import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/presentation/pages/post_grievance/controller/post_grievance_controller.dart';
import 'package:grievance_portal/presentation/widgets/back_handler.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_textfield.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class PostGrievancePage extends GetView<PostGrievanceController> {
  const PostGrievancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return backHanlder(
        child: Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CommonAppbar(
        title: "Post_Grievance".tr,
        onLeadingTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => controller.file.value == null
                  ? GestureDetector(
                      onTap: () {
                        controller.pickUpFile();
                      },
                      child: Assets.images.uploadImage
                          .image()
                          .paddingOnly(bottom: 32),
                    )
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            controller.file.value?.name ?? "",
                            maxLines: 1,
                          )),
                          GestureDetector(
                            onTap: () {
                              controller.file.value = null;
                            },
                            child: Container(
                                color: Colors.transparent,
                                height: 15,
                                width: 15,
                                child: Assets.images.close.svg()),
                          )
                        ],
                      ).paddingSymmetric(horizontal: 21),
                    ),
            ),
            CommonTextField(
              controller: controller.nameController,
              hintText: 'Enter_here'.tr,
              title: "Name".tr,
              onChange: (p0) {
                controller.isValidCheck();
              },
            ).paddingOnly(bottom: 32),
            CommonTextField(
              controller: controller.departmentController,
              hintText: 'Select'.tr,
              title: "Department".tr,
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                size: 30,
                color: AppColors.textColor.withOpacity(0.3),
              ),
              onTap: () {
                if (controller.tempDepartmentId.isNotEmpty) {
                  controller.selectedDepartmentId.value =
                      controller.tempDepartmentId;
                }
                Get.toNamed(RouteList.departmentPage);
              },
              onChange: (value) {
                controller.isValidCheck();
              },
            ).paddingOnly(bottom: 32),
            CommonTextField(
              controller: controller.addressController,
              hintText: 'Search_google_address'.tr,
              title: "Address".tr,
              onChange: (value) {
                controller.isValidCheck();
              },
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.shape.svg(height: 18, width: 18),
                ],
              ),
            ).paddingOnly(bottom: 32),
            CommonTextField(
              controller: controller.messageController,
              hintText: 'Message'.tr,
              title: "Grievance_Details".tr,
              maxLines: 5,
              onChange: (value) {
                controller.isValidCheck();
              },
            ).paddingOnly(bottom: 32),
            Obx(
              () => Opacity(
                opacity: controller.isValid.value ? 1 : 0.5,
                child: CommonButton(
                  text: "Submit".tr,
                  onTap: controller.isValid.value
                      ? () {
                          controller.postGrievance();
                        }
                      : () {},
                ),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 40),
      ),
    ));
  }
}
