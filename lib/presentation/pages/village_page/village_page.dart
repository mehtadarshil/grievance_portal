import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/post_grievance/controller/post_grievance_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class VillagePage extends GetView<PostGrievanceController> {
  const VillagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CommonAppbar(title: "Select_Village".tr),
      body: Obx(
        () => controller.villageModel.value != null
            ? ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                itemCount: controller.villageModel.value!.data!.length,
                itemBuilder: (context, index) {
                  var data = controller.villageModel.value!.data![index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectedVillageId.value = data.idVillage!;
                      controller.tempVillageName =
                          Get.locale?.languageCode == "en"
                              ? data.villageName ?? ""
                              : data.villageNameOdia ?? "";
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
                                  ? data.villageName ?? ""
                                  : data.villageNameOdia ?? "",
                              style: const TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 16),
                            ).paddingSymmetric(horizontal: 21, vertical: 21),
                          ),
                          Obx(
                            () => Transform.scale(
                              scale: 1.2,
                              child: Radio(
                                value: data.idVillage,
                                groupValue: controller.selectedVillageId.value,
                                onChanged: (value) {
                                  controller.selectedVillageId.value = value!;
                                  controller.tempVillageName =
                                      Get.locale?.languageCode == "en"
                                          ? data.villageName ?? ""
                                          : data.villageNameOdia ?? "";
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
          controller.villageController.text = controller.tempVillageName;
          controller.tempVillageId = controller.selectedVillageId.value;
          Get.back();
        },
      ).paddingSymmetric(horizontal: 20, vertical: 33),
    );
  }
}
