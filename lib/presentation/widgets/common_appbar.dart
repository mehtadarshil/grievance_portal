import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class CommonAppbar extends AppBar {
  CommonAppbar(
      {super.key,
      required String title,
      String? subTitle,
      VoidCallback? onLeadingTap})
      : super(
          backgroundColor: AppColors.whiteColor,
          elevation: 2,
          centerTitle: true,
          foregroundColor: AppColors.blackColor,
          toolbarHeight: subTitle != null ? 112 : null,
          title: subTitle != null
              ? Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: FontFamily.urbanistBold,
                          fontSize: 22),
                    ).paddingOnly(bottom: 16),
                    Text(
                      subTitle,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: FontFamily.urbanistRegular,
                          fontSize: 16),
                    )
                  ],
                )
              : Text(
                  title,
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: FontFamily.urbanistBold,
                      fontSize: 22),
                ),
          actions: subTitle != null
              ? [
                  const SizedBox(
                    width: 40,
                  )
                ]
              : null,
          leading: onLeadingTap != null
              ? GestureDetector(
                  onTap: onLeadingTap,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Assets.images.shape2.svg(height: 24, width: 24)],
                  ),
                )
              : null,
        );
}
