import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/models/grievence_complete_detail_model.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:intl/intl.dart';

class GrievenceDetailPage extends StatelessWidget {
  const GrievenceDetailPage({super.key, required this.data});

  final GrievenceCompleteDetailModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CommonAppbar(title: "Grievence_Details".tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "${"Request_Id".tr} : ",
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistSemiBold,
                            fontSize: 15)),
                    TextSpan(
                        text: data.data!.first.uniqueRequestId ?? "",
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistRegular,
                            fontSize: 15))
                  ])).paddingOnly(bottom: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "${"Customer_Name".tr} : ",
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistSemiBold,
                            fontSize: 15)),
                    TextSpan(
                        text: data.data!.first.customerName ?? "",
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistRegular,
                            fontSize: 15))
                  ])).paddingOnly(bottom: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "${"Description".tr} : ",
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistSemiBold,
                            fontSize: 15)),
                    TextSpan(
                        text: data.data!.first.requestDescription ?? "",
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistRegular,
                            fontSize: 15))
                  ])).paddingOnly(bottom: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "${"Date_Created".tr} : ",
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistSemiBold,
                            fontSize: 15)),
                    TextSpan(
                        text: DateFormat("dd MMM,yyyy hh:mm:aa")
                            .format(data.data!.first.createdOn!),
                        style: const TextStyle(
                            fontFamily: FontFamily.urbanistRegular,
                            fontSize: 15))
                  ])).paddingOnly(bottom: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
