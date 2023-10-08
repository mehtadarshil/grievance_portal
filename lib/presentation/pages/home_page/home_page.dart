import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/home_page/controller/home_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/presentation/widgets/common_outline_button.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 2,
        centerTitle: true,
        title: Text(
          "GRIEVANCE_PORTAL".tr,
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: CommonOutlineButton(
                        onTap: () {
                          Get.toNamed(RouteList.dashboard);
                        },
                        text: "Home".tr)),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                    child: CommonOutlineButton(onTap: () {}, text: "About".tr))
              ],
            ).paddingSymmetric(horizontal: 31, vertical: 21),
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Assets.images.onBoardingImage.image(height: 282)),
            Text(
              "Welcome_to_Grievance".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: FontFamily.urbanistBold, fontSize: 26),
            ).paddingSymmetric(horizontal: 21, vertical: 21),
            Text(
              "Please_click_on_the_below_buttons".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: FontFamily.urbanistRegular,
                fontSize: 16,
              ),
            ).paddingSymmetric(horizontal: 21),
            const SizedBox(
              height: 50,
            ),
            CommonButton(
              text: "Post_Grievance".tr,
              onTap: () {},
              color: AppColors.primaryBlueColor,
            ).paddingSymmetric(horizontal: 20),
            const SizedBox(
              height: 12,
            ),
            CommonButton(
              text: "Track_Grievance".tr,
              onTap: () {},
              color: AppColors.primaryRedColor,
            ).paddingSymmetric(horizontal: 20),
          ],
        ),
      ),
    );
  }
}