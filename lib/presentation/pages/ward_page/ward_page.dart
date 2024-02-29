import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/post_grievance/controller/post_grievance_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class WardPage extends GetView<PostGrievanceController> {
  const WardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CommonAppbar(title: "Select_GPWard".tr),
      body: Obx(
        () => controller.wardModel.value != null
            ? ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                itemCount: controller.wardModel.value!.data!.length,
                itemBuilder: (context, index) {
                  var data = controller.wardModel.value!.data![index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectedWardId.value = data.idGpward!;
                      controller.tempWardName = Get.locale?.languageCode == "en"
                          ? data.gpwardName ?? ""
                          : data.gpwardNameOdia ?? "";
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              Get.locale?.languageCode == "en"
                                  ? data.gpwardName ?? ""
                                  : data.gpwardNameOdia ?? "",
                              style: const TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 16),
                            ).paddingSymmetric(horizontal: 21, vertical: 21),
                          ),
                          Obx(
                            () => Transform.scale(
                              scale: 1.2,
                              child: Radio(
                                value: data.idGpward,
                                groupValue: controller.selectedWardId.value,
                                onChanged: (value) {
                                  controller.selectedWardId.value = value!;
                                  controller.tempWardName =
                                      Get.locale?.languageCode == "en"
                                          ? data.gpwardName ?? ""
                                          : data.gpwardNameOdia ?? "";
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : const SizedBox.shrink(),
      ),
      bottomNavigationBar: CommonButton(
        text: "Add".tr,
        onTap: () {
          controller.wardController.text = controller.tempWardName;
          controller.tempWardId = controller.selectedWardId.value;
          controller.villageController.text = "";
          controller.tempVillageId = "";
          controller.getVillageList(controller.tempWardId);
          Get.back();
        },
      ).paddingSymmetric(horizontal: 20, vertical: 33),
    );
  }
}
