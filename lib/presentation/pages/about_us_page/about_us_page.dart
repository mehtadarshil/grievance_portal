import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/di/app_base_component.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "About".tr),
      body: WebView(
        initialUrl: "https://home.arrowleaf.solutions/grievances/#about",
        backgroundColor: AppColors.bgColor,
        onProgress: (progress) {
          if (progress >= 100) {
            AppComponentBase.instance.hideProgressDialog();
          } else {
            AppComponentBase.instance.showProgressDialog();
          }
        },
      ),
    );
  }
}
