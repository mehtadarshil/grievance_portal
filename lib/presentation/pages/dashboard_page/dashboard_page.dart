import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/gen/assets.gen.dart';
import 'package:grievance_portal/presentation/pages/dashboard_page/controller/dashboard_controller.dart';
import 'package:grievance_portal/presentation/widgets/dashboard_card.dart';
import 'package:grievance_portal/presentation/widgets/drawer.dart';
import 'package:grievance_portal/utils/appcolors.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 2,
        centerTitle: true,
        title: Text(
          "Dashboard".tr,
          style: TextStyle(color: AppColors.blackColor),
        ),
        leading: GestureDetector(
          onTap: () {
            controller.scaffoldKey.currentState?.openDrawer();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Assets.images.shape2.svg(height: 24, width: 24)],
          ),
        ),
      ),
      body: ListView(
        children: [
          DashboardCard(
            onTap: () {},
            title: "12:34 PM",
            secondTitle: "03 Aug, 2023",
            image: Assets.images.clock,
            color: AppColors.firstCardColor,
          ),
          DashboardCard(
            onTap: () {},
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
          DashboardCard(
            onTap: () {},
            title: "8",
            secondTitle: "Total_Grievance".tr,
            image: Assets.images.documentation,
            color: AppColors.fourthCardColor,
          )
        ],
      ),
    );
  }
}
