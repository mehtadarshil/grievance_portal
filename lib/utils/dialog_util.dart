import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class DialogUtil {
  static void verifiedDialog() async {
    await showDialog(
      context: Get.context!,
      builder: (context) => const VerifiedDialog(),
    );
  }

  static void postGrievanceThankYouDialog() async {
    await showDialog(
      context: Get.context!,
      builder: (context) => const PostGrievanceThankYouDialog(),
    );
  }

  static void confirmationDialog(
          {required VoidCallback onConfirm, String? title}) =>
      showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: Text(
            title ?? "delete_title".tr,
            style: const TextStyle(
                fontFamily: FontFamily.urbanistMedium, fontSize: 14),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "cancel".tr,
                  style: TextStyle(
                      fontFamily: FontFamily.urbanistSemiBold,
                      fontSize: 12,
                      color: AppColors.primaryBlueColor),
                )),
            TextButton(
                onPressed: onConfirm,
                child: Text(
                  "confirm".tr,
                  style: TextStyle(
                      fontFamily: FontFamily.urbanistSemiBold,
                      fontSize: 12,
                      color: AppColors.primaryRedColor),
                ))
          ],
        ),
      );

  static void customDialog({required String title, bool? error}) {
    showDialog(
      context: Get.context!,
      builder: (context) => CustomDialogWidget(
        title: title,
        error: error ?? false,
      ),
    );
  }
}

class VerifiedDialog extends StatelessWidget {
  const VerifiedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 41, vertical: 33),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verified".tr,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistExtraBold, fontSize: 26),
              ),
              const SizedBox(
                height: 61,
              ),
              Assets.images.checkmark
                  .image(color: AppColors.greenColor, height: 80, width: 80),
              const SizedBox(
                height: 37,
              ),
              Text(
                "You_have_successfully_verified_the".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistRegular, fontSize: 16),
              ).paddingOnly(bottom: 8),
              Text(
                "GRIEVANCE_PORTAL".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistBold, fontSize: 16),
              ).paddingOnly(bottom: 15),
              CommonButton(
                text: "Send_Inquiry".tr,
                onTap: () {
                  Get.until(
                      (route) => route.settings.name == RouteList.homePage);
                  Get.toNamed(RouteList.postGrievancePage);
                },
                color: Colors.transparent,
                textColor: AppColors.primaryBlueColor,
              ),
              CommonButton(
                text: "Go_to_Dashboard".tr,
                onTap: () {
                  Get.offAllNamed(RouteList.dashboard);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PostGrievanceThankYouDialog extends StatelessWidget {
  const PostGrievanceThankYouDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 41, vertical: 33),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Thank_You".tr,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistExtraBold, fontSize: 26),
              ),
              const SizedBox(
                height: 61,
              ),
              Assets.images.checkmark
                  .image(color: AppColors.greenColor, height: 80, width: 80),
              const SizedBox(
                height: 37,
              ),
              Text(
                "Submitting_your_grievances".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistRegular, fontSize: 16),
              ).paddingOnly(bottom: 60),
              CommonButton(
                text: "Go_to_Dashboard".tr,
                onTap: () {
                  Get.offAllNamed(RouteList.dashboard);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget(
      {super.key, required this.title, this.error = false});

  final String title;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 41, vertical: 33),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error ? "Failed".tr : "Thank_You".tr,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistExtraBold, fontSize: 26),
              ),
              if (!error)
                const SizedBox(
                  height: 61,
                ),
              if (!error)
                Assets.images.checkmark
                    .image(color: AppColors.greenColor, height: 80, width: 80),
              const SizedBox(
                height: 37,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: FontFamily.urbanistRegular, fontSize: 16),
              ).paddingOnly(bottom: 60),
              CommonButton(
                text: "Close".tr,
                onTap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
