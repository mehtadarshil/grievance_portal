import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/re_open_grievance_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_textfield.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class ReOpenGrievance extends GetView<ReOpenGrievanceController> {
  const ReOpenGrievance({super.key});

  @override
  ReOpenGrievanceController get controller =>
      Get.put(ReOpenGrievanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Re Open Grievance"),
      body: Column(
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
            controller: controller.reOpenReasonController,
            hintText: 'Enter_here'.tr,
            title: "Reopen Reason".tr,
            maxLines: 5,
          ).paddingOnly(bottom: 32),
          CommonButton(
            text: "Submit".tr,
            onTap: () {
              controller.reOpenGrievance();
            },
          )
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 20),
    );
  }
}
