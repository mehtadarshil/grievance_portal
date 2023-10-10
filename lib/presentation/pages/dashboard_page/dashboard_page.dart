import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/presentation/pages/dashboard_page/controller/dashboard_controller.dart';
import 'package:grievance_portal/presentation/widgets/back_handler.dart';
import 'package:grievance_portal/presentation/widgets/common_appbar.dart';
import 'package:grievance_portal/presentation/widgets/dashboard_card.dart';
import 'package:grievance_portal/utils/appcolors.dart';
import 'package:intl/intl.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return backHanlder(
      child: Scaffold(
        appBar: CommonAppbar(
          title: "Dashboard".tr,
          onLeadingTap: () {},
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            StreamBuilder<DateTime>(
                stream: controller.timer,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  return DashboardCard(
                    onTap: () {},
                    title: DateFormat("hh:mm aa").format(snapshot.data!),
                    secondTitle:
                        DateFormat("dd MMM, yyyy").format(snapshot.data!),
                    image: Assets.images.clock,
                    color: AppColors.firstCardColor,
                  );
                }),
            DashboardCard(
              onTap: () {
                Get.toNamed(RouteList.postGrievancePage)!.then((value) {
                  controller.getTotalGrievance();
                });
              },
              title: "Post_Grievance".tr,
              image: Assets.images.paperPlane,
              color: AppColors.secondCardColor,
            ),
            DashboardCard(
              onTap: () {},
              title: "Track_Grievance".tr,
              image: Assets.images.key,
              color: AppColors.thirdCardColor,
            ),
            Obx(
              () => DashboardCard(
                onTap: () {
                  Get.toNamed(RouteList.grievanceListPage);
                },
                title:
                    (controller.totalGrievance.value?.data?.totalUserRequests ??
                            0)
                        .toString(),
                secondTitle: "Total_Grievance".tr,
                image: Assets.images.documentation,
                color: AppColors.fourthCardColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
