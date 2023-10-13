import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/models/grievence_history_model.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:intl/intl.dart';
import 'package:simple_html_css/simple_html_css.dart';

class GrievenceHistory extends StatelessWidget {
  const GrievenceHistory({super.key, required this.data});

  final GrievenceHistoryModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CommonAppbar(
        title: "Grievance_History".tr,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: data.data!.length,
        itemBuilder: (context, index) {
          var detail = data.data![index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "${"Status".tr} : ",
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistSemiBold,
                          fontSize: 15)),
                  TextSpan(
                      text: detail.status ?? "",
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistRegular, fontSize: 15))
                ])).paddingOnly(bottom: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "${"Date_Created".tr} : ",
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistSemiBold,
                          fontSize: 15)),
                  TextSpan(
                      text: DateFormat("dd MMM,yyyy hh:mm:aa")
                          .format(detail.createdOn!),
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistRegular, fontSize: 15))
                ])).paddingOnly(bottom: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "${"Remark".tr} : ",
                      style: const TextStyle(
                          fontFamily: FontFamily.urbanistSemiBold,
                          fontSize: 15)),
                  HTML.toTextSpan(context, detail.remarks ?? "",
                      defaultTextStyle: const TextStyle(
                          fontFamily: FontFamily.urbanistRegular, fontSize: 15))
                ]))
              ],
            ),
          );
        },
      ),
    );
  }
}
