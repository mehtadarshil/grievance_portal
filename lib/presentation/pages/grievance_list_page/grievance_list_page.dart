import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/grievance_list_controller.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/full_screen_image_viewer.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/re_open_grievance.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/send_message_page.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:intl/intl.dart';

class GrievanceListPage extends GetView<GrievanceListController> {
  const GrievanceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Grievance_List".tr),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (controller.grievanceDetails.value != null) {
                  List<DataRow> data = [];
                  for (var i = 0;
                      i < controller.grievanceDetails.value!.data!.length;
                      i++) {
                    var detail = controller.grievanceDetails.value!.data![i];
                    data.add(DataRow(cells: [
                      DataCell(Text(
                        (i + 1).toString(),
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 12,
                            color: AppColors.textColor),
                      )),
                      DataCell(Text(
                        detail.uniqueRequestId ?? "",
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 12,
                            color: AppColors.textColor),
                      )),
                      DataCell(SizedBox(
                        width: 130,
                        child: SingleChildScrollView(
                          child: Column(
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
                                    detail.requestFileArray!.first
                                        .requestImagePath!
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
                            ],
                          ),
                        ),
                      )),
                      DataCell(
                          /* detail.requestStatus == "1"
                          ? Text(
                              detail.status ?? "",
                              style: TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 12,
                                  color: AppColors.textColor),
                            )
                          : */
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
                            width: 110,
                            height: 32,
                            child: CommonButton(
                                fontSize: 10,
                                onTap: () {
                                  controller
                                      .getGrievenceHistory(detail.idRequest!);
                                },
                                maxlines: 2,
                                text: "View Complete Updates"),
                          ),
                        ],
                      )),
                      DataCell(Center(
                        child: SizedBox(
                          width: 75,
                          height: 32,
                          child: detail.requestEmailstatusArray!.isNotEmpty
                              ? CommonButton(
                                  fontSize: 10,
                                  onTap: () {
                                    controller.getGrievenceEmailHistory(
                                        grievenceId: detail.idRequest!);
                                  },
                                  maxlines: 2,
                                  color: AppColors.primaryRedColor,
                                  text: "View All Messages")
                              : null,
                        ),
                      )),
                      DataCell(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 20,
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
                            if (detail
                                .latestRequestEmailstatusArray!.isNotEmpty)
                              SizedBox(
                                width: 90,
                                height: 20,
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
                                    color: detail.latestRequestEmailstatusArray
                                                ?.first.idEmailHistory ==
                                            "10"
                                        ? AppColors.primaryRedColor
                                        : AppColors.primaryBlueColor,
                                    text: detail.latestRequestEmailstatusArray
                                                ?.first.idEmailHistory ==
                                            "10"
                                        ? "Respond"
                                        : "Responded"),
                              ).paddingOnly(top: 5),
                            if (detail.status == "Closed")
                              Column(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    height: 20,
                                    child: CommonButton(
                                      text: "ReOpen",
                                      fontSize: 10,
                                      onTap: () {
                                        Get.to(() => const ReOpenGrievance(),
                                                arguments: detail)!
                                            .then((value) {
                                          controller.getGrievanceList();
                                        });
                                      },
                                      maxlines: 2,
                                    ),
                                  ).paddingOnly(top: 5)
                                ],
                              )
                          ],
                        ),
                      ),
                    ]));
                  }
                  return SingleChildScrollView(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          headingRowHeight: 29,
                          dataRowHeight: 120,
                          columnSpacing: 20,
                          headingRowColor:
                              MaterialStatePropertyAll(AppColors.headerColor),
                          columns: const [
                            DataColumn(
                                label: Text(
                              "Si",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 12,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Grievance ID",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 12,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Details",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 12,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Status Updates",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 12,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Message Updates",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 12,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Action",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 12,
                              ),
                            )),
                          ],
                          rows: data),
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
