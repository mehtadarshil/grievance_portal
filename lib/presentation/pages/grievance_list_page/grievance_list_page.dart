import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/gen/fonts.gen.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/grievance_list_controller.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/common_button.dart';
import 'package:grievance_portal/utils/appcolors.dart';

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
                        i.toString(),
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 10,
                            color: AppColors.textColor.withOpacity(0.5)),
                      )),
                      DataCell(Text(
                        detail.uniqueRequestId ?? "",
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 10,
                            color: AppColors.textColor.withOpacity(0.5)),
                      )),
                      DataCell(Text(
                        detail.departmentNames ?? "",
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 10,
                            color: AppColors.textColor.withOpacity(0.5)),
                      )),
                      DataCell(Text(
                        detail.requestDescription ?? "",
                        style: TextStyle(
                            fontFamily: FontFamily.urbanistMedium,
                            fontSize: 10,
                            color: AppColors.textColor.withOpacity(0.5)),
                      )),
                      DataCell(detail.requestStatus == "1"
                          ? Text(
                              detail.status ?? "",
                              style: TextStyle(
                                  fontFamily: FontFamily.urbanistMedium,
                                  fontSize: 10,
                                  color: AppColors.textColor.withOpacity(0.5)),
                            )
                          : SizedBox(
                              width: 150,
                              height: 20,
                              child: CommonButton(
                                  fontSize: 10,
                                  onTap: () {},
                                  text: "View Complete Updates"),
                            )),
                      DataCell(SizedBox(
                        width: 120,
                        height: 20,
                        child: CommonButton(
                            fontSize: 10,
                            onTap: () {},
                            color: AppColors.primaryRedColor,
                            text: "View All Emails"),
                      )),
                      DataCell(
                        Column(
                          children: [
                            Assets.images.actionIcon.svg(height: 16, width: 4),
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
                          dataRowHeight: 25,
                          columnSpacing: 20,
                          headingRowColor:
                              MaterialStatePropertyAll(AppColors.headerColor),
                          columns: const [
                            DataColumn(
                                label: Text(
                              "Si",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 10,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Grievance ID",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 10,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Department",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 10,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Descriprion",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 10,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Status",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 10,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Message Updates",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 10,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Action",
                              style: TextStyle(
                                fontFamily: FontFamily.urbanistMedium,
                                fontSize: 10,
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
