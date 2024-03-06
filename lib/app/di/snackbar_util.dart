import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class SnackBarUtil {
  static void showSnackBar(
      {String? title,
      required String message,
      Duration? duration,
      bool? success}) {
    Get.closeCurrentSnackbar();
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        message,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 15,
            fontFamily: FontFamily.urbanistBold),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      animationDuration: const Duration(milliseconds: 600),
      duration: duration ?? const Duration(seconds: 6),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      barBlur: 0,
      backgroundColor: (success ?? false)
          ? AppColors.primaryBlueColor
          : AppColors.primaryRedColor,
      snackStyle: SnackStyle.FLOATING,

      // backgroundGradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [AppColors.primaryDarkColor, AppColors.primaryLightColor]),
    ));
  }
}
