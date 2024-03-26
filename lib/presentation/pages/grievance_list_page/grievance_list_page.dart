import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/grievance_list_controller.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/full_screen_image_viewer.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/re_open_grievance.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/send_message_page.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/your_feedback_page.dart';
import 'package:grievance_portal/presentation/widgets/blinking_text.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:intl/intl.dart';

class GrievanceListPage extends GetView<GrievanceListController> {
  const GrievanceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: "Grievance_List".tr,
        actions: [
          TextButton(
              onPressed: () {
                controller.getGrievanceList();
              },
              child: Text("refresh".tr))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (controller.grievanceDetails.value != null) {
                  List<TableRow> data = [];
                  for (var i = 0;
                      i < controller.grievanceDetails.value!.data!.length;
                      i++) {
                    var detail = controller.grievanceDetails.value!.data![i];
                    data.add(TableRow(children: [
                      // Text(
                      //   (i + 1).toString(),
                      //   style: TextStyle(
                      //       fontFamily: FontFamily.urbanistMedium,
                      //       fontSize: 12,
                      //       color: AppColors.textColor),
                      // ),
                      Text(
                        detail.uniqueRequestId ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 12,
                            color: AppColors.textColor),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (detail.requestFileArray!.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                Get.to(() => FullScreenImageViewer(
                                    url: detail.requestFileArray!.first
                                        .requestImagePath!
                                        .replaceAll(" ", "")));
                              },
                              child: Image.network(
                                detail.requestFileArray!.first.requestImagePath!
                                    .replaceAll(" ", ""),
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(
                                    "Failed To Load Image",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: FontFamily.urbanistBold,
                                        color: AppColors.primaryRedColor),
                                  );
                                },
                                height: 50,
                                width: 50,
                              ),
                            ).paddingOnly(top: 10, bottom: 10),
                          if (detail.requestDescription != null)
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Description: ",
                                style: TextStyle(
                                    fontFamily: FontFamily.urbanistBold,
                                    fontSize: 12,
                                    color: AppColors.textColor),
                              ),
                              TextSpan(
                                text: detail.requestDescription ?? "",
                                style: TextStyle(
                                    fontFamily: FontFamily.urbanistMedium,
                                    fontSize: 12,
                                    color: AppColors.textColor),
                              )
                            ])).paddingOnly(bottom: 10),
                          if (detail.departmentNames != null)
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Department: ",
                                style: TextStyle(
                                    fontFamily: FontFamily.urbanistBold,
                                    fontSize: 12,
                                    color: AppColors.textColor),
                              ),
                              TextSpan(
                                text: detail.departmentNames ?? "",
                                style: TextStyle(
                                    fontFamily: FontFamily.urbanistMedium,
                                    fontSize: 12,
                                    color: AppColors.textColor),
                              )
                            ])).paddingOnly(bottom: 10),
                          if (detail.createdOn != null)
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Date Created: ",
                                style: TextStyle(
                                    fontFamily: FontFamily.urbanistBold,
                                    fontSize: 12,
                                    color: AppColors.textColor),
                              ),
                              TextSpan(
                                text: DateFormat("dd MMM,yyyy hh:mm:aa")
                                    .format(detail.createdOn!),
                                style: TextStyle(
                                    fontFamily: FontFamily.urbanistMedium,
                                    fontSize: 12,
                                    color: AppColors.textColor),
                              )
                            ])).paddingOnly(bottom: 10),
                          SizedBox(
                            height: 30,
                            child: CommonButton(
                                fontSize: 10,
                                onTap: () {
                                  controller.getDetailedGrievence(
                                      grievenceId: detail.idRequest!);
                                },
                                maxlines: 2,
                                color: AppColors.primaryRedColor,
                                text: "View Details"),
                          ),
                          if (detail.latestRequestEmailstatusArray!.isNotEmpty)
                            SizedBox(
                              height: 30,
                              child: CommonButton(
                                      fontSize: 10,
                                      onTap: () {
                                        Get.to(() => const SendMessagePage(),
                                                arguments: detail.idRequest)!
                                            .then((value) {
                                          controller.getGrievanceList();
                                        });
                                      },
                                      maxlines: 2,
                                      color: detail
                                                  .latestRequestEmailstatusArray
                                                  ?.first
                                                  .emailRespondUserStatus ==
                                              ""
                                          ? AppColors.primaryRedColor
                                          : AppColors.greenColor,
                                      text: detail
                                                  .latestRequestEmailstatusArray
                                                  ?.first
                                                  .emailRespondUserStatus ==
                                              ""
                                          ? "Respond"
                                          : "Responded")
                                  .paddingOnly(top: 5),
                            ),
                          if (detail.requestStatus == "2" ||
                              detail.requestStatus == "3")
                            Column(
                              children: [
                                detail.totalReopened != null &&
                                        detail.totalReopened! < 1
                                    ? SizedBox(
                                        height: 30,
                                        child: CommonButton(
                                          text: "ReOpen",
                                          color: AppColors.primaryRedColor,
                                          fontSize: 10,
                                          onTap: () {
                                            Get.to(
                                                    () =>
                                                        const ReOpenGrievance(),
                                                    arguments: detail)!
                                                .then((value) {
                                              controller.getGrievanceList();
                                            });
                                          },
                                          maxlines: 2,
                                        ).paddingOnly(top: 5),
                                      )
                                    : SizedBox(
                                        height: 30,
                                        child: CommonButton(
                                          text: "Your Feedback",
                                          color: AppColors.primaryBlueColor,
                                          fontSize: 10,
                                          onTap: () {
                                            Get.to(
                                                    () =>
                                                        const YourFeedBackPage(),
                                                    arguments: detail)!
                                                .then((value) {
                                              controller.getGrievanceList();
                                            });
                                          },
                                          maxlines: 2,
                                        ).paddingOnly(top: 5),
                                      )
                              ],
                            )
                        ],
                      ).paddingSymmetric(vertical: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            detail.status ?? "",
                            style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 12,
                                color: AppColors.textColor),
                          ).paddingOnly(bottom: 5),
                          SizedBox(
                            height: 32,
                            child: CommonButton(
                                fontSize: 10,
                                onTap: () {
                                  controller
                                      .getGrievenceHistory(detail.idRequest!);
                                },
                                maxlines: 2,
                                text: "View All Updates"),
                          ),
                        ],
                      ),
                      detail.requestEmailstatusArray!.isNotEmpty
                          ? Column(
                              children: [
                                detail.latestRequestEmailstatusArray?.first
                                            .emailRespondUserStatus ==
                                        ""
                                    ? BlinkingText(
                                        text: "new_message".tr,
                                      ).paddingOnly(bottom: 8)
                                    : const SizedBox.shrink(),
                                SizedBox(
                                  height: 32,
                                  child: CommonButton(
                                      fontSize: 9,
                                      onTap: () {
                                        controller.getGrievenceEmailHistory(
                                            grievenceId: detail.idRequest!);
                                      },
                                      maxlines: 2,
                                      color: AppColors.primaryRedColor,
                                      text: "View All Messages"),
                                ),
                              ],
                            ).paddingSymmetric(vertical: 5, horizontal: 5)
                          : const SizedBox.shrink(),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [

                      //   ],
                      // ).paddingSymmetric(horizontal: 5, vertical: 5),
                    ]));
                  }
                  return SingleChildScrollView(
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1.8),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(1),
                        4: FlexColumnWidth(1),
                      },
                      border: TableBorder(
                          horizontalInside: BorderSide(
                              color: AppColors.blackColor, width: 0.5)),
                      // headingRowHeight: 29,
                      // dataRowHeight: 120,
                      // columnSpacing: 20,
                      // headingRowColor:
                      //     MaterialStatePropertyAll(AppColors.headerColor),
                      children: [
                        TableRow(
                            decoration:
                                BoxDecoration(color: AppColors.headerColor),
                            children: [
                              // Text(
                              //   "Si",
                              //   style: TextStyle(
                              //     fontFamily: FontFamily.urbanistMedium,
                              //     fontSize: 12,
                              //   ),
                              // ),
                              const Text(
                                "Grievance ID",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 12,
                                ),
                              ).paddingSymmetric(vertical: 5),
                              const Text(
                                "Details",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 12,
                                ),
                              ).paddingSymmetric(vertical: 5),
                              const Text(
                                "Status Updates",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 12,
                                ),
                              ).paddingSymmetric(vertical: 5),
                              const Text(
                                "Message Updates",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 12,
                                ),
                              ).paddingSymmetric(vertical: 5),
                              // const Text(
                              //   "Action",
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     fontFamily: FontFamily.urbanistMedium,
                              //     fontSize: 12,
                              //   ),
                              // ).paddingSymmetric(vertical: 5),
                            ]),
                        ...data
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
