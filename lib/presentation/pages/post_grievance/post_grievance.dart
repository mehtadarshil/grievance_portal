import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_autocomplete_flutter/google_places_autocomplete_flutter.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
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
        onLeadingTap: () {
          Get.offAllNamed(RouteList.dashboard);
        },
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
                              controller.isValidCheck();
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
              controller: controller.wardController,
              hintText: 'Select'.tr,
              title: "Select_GPWard".tr,
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                size: 30,
                color: AppColors.textColor.withOpacity(0.3),
              ),
              onTap: () {
                if (controller.tempWardId.isNotEmpty) {
                  controller.selectedWardId.value = controller.tempWardId;
                }
                Get.toNamed(RouteList.wardPage);
              },
              onChange: (value) {
                controller.isValidCheck();
              },
            ).paddingOnly(bottom: 32),
            CommonTextField(
              controller: controller.villageController,
              hintText: 'Select'.tr,
              title: "Select_Village".tr,
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                size: 30,
                color: AppColors.textColor.withOpacity(0.3),
              ),
              onTap: () {
                if (controller.tempVillageId.isNotEmpty) {
                  controller.selectedVillageId.value = controller.tempVillageId;
                }
                Get.toNamed(RouteList.villagePage);
              },
              onChange: (value) {
                controller.isValidCheck();
              },
            ).paddingOnly(bottom: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  "Location".tr,
                  style: const TextStyle(
                      fontFamily: FontFamily.urbanistMedium, fontSize: 16),
                ),
              ).paddingOnly(bottom: 11),
            ),
            GooglePlaceAutoCompleteFlutterTextField(
              textEditingController: controller.addressController,
              googleAPIKey: "AIzaSyAa2DDyBCbm_HxtxGGGm367ao_NrSHOiFc",
              debounceTime: 300,
              inputDecoration: InputDecoration(
                  filled: true,
                  hintText: 'Search_google_address'.tr,
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.shape.svg(height: 18, width: 18),
                    ],
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                  hintStyle: TextStyle(
                      fontFamily: FontFamily.urbanistMedium,
                      fontSize: 16,
                      color: AppColors.textColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: AppColors.whiteColor),
              itmClick: (postalCodeResponse) {
                controller.addressController.text =
                    postalCodeResponse.description ?? "";
                controller.isValidCheck();
              },
            ).paddingOnly(bottom: 22),
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
