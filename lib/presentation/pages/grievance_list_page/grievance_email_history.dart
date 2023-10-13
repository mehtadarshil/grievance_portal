import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/models/grievence_email_history_model.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:intl/intl.dart';
import 'package:simple_html_css/simple_html_css.dart';

class GrievenceEmailHisoryPage extends StatelessWidget {
  const GrievenceEmailHisoryPage({super.key, required this.data});

  final GrievenceEmailHistoryModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CommonAppbar(title: "Email_History".tr),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: data.data!.length,
        itemBuilder: (context, index) {
          var detail = data.data![index];
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: detail.sendBy == "Admin"
                                ? "From_Admin_to_You".tr
                                : "From_You_to_Admin".tr,
                            style: const TextStyle(
                                fontFamily: FontFamily.urbanistSemiBold,
                                fontSize: 15)),
                        const TextSpan(
                            text: " || ",
                            style: TextStyle(
                                fontFamily: FontFamily.urbanistSemiBold,
                                fontSize: 15)),
                        TextSpan(
                            text: DateFormat("dd MMM,yyyy hh:mm:aa")
                                .format(detail.createdOn!),
                            style: const TextStyle(
                                fontFamily: FontFamily.urbanistSemiBold,
                                fontSize: 15))
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).paddingSymmetric(vertical: 5),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "${"Subject".tr} : ",
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistSemiBold,
                          fontSize: 15)),
                  TextSpan(
                      text: detail.subject ?? "",
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistRegular, fontSize: 15))
                ])).paddingOnly(bottom: 5, left: 10, right: 10),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "${"Message_field".tr} : ",
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistSemiBold,
                          fontSize: 15)),
                  HTML.toTextSpan(context,
                      (detail.emailStatusRemarks ?? "").replaceAll("\\", ""),
                      defaultTextStyle: const TextStyle(
                          fontFamily: FontFamily.urbanistRegular, fontSize: 15))
                ])).paddingOnly(bottom: 5, left: 10, right: 10),
              ],
            ),
          ).paddingOnly(bottom: 5);
        },
      ),
    );
  }
}
