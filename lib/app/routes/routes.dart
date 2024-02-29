import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/routes/bindings/dashboard_binding.dart';
import 'package:grievance_portal/app/routes/bindings/grievance_list_bindings.dart';
import 'package:grievance_portal/app/routes/bindings/home_binding.dart';
import 'package:grievance_portal/app/routes/bindings/log_in_bindings.dart';
import 'package:grievance_portal/app/routes/bindings/post_grievance_binding.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/presentation/pages/about_us_page/about_us_page.dart';
import 'package:grievance_portal/presentation/pages/dashboard_page/dashboard_page.dart';
import 'package:grievance_portal/presentation/pages/department_page/department_page.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/grievance_list_page.dart';
import 'package:grievance_portal/presentation/pages/home_page/home_page.dart';
import 'package:grievance_portal/presentation/pages/log_in_page/log_in_page.dart';
import 'package:grievance_portal/presentation/pages/post_grievance/post_grievance.dart';
import 'package:grievance_portal/presentation/pages/village_page/village_page.dart';
import 'package:grievance_portal/presentation/pages/ward_page/ward_page.dart';

class Routes {
  static List<GetPage<dynamic>> getRoutes() => [
        getPage(
            name: RouteList.homePage,
            page: const HomePage(),
            bindings: HomeBinding()),
        getPage(
            name: RouteList.dashboard,
            page: const DashboardPage(),
            bindings: DashboardBindings()),
        getPage(
            name: RouteList.postGrievancePage,
            page: const PostGrievancePage(),
            bindings: PostGrievanceBindings()),
        getPage(
            name: RouteList.logInPage,
            page: const LogInPage(),
            bindings: LoginBindings()),
        getPage(
          name: RouteList.departmentPage,
          page: const DepartmentPage(),
        ),
        getPage(
            name: RouteList.grievanceListPage,
            page: const GrievanceListPage(),
            bindings: GrievanceListBindings()),
        getPage(
          name: RouteList.aboutUsPage,
          page: const AboutUsPage(),
        ),
        getPage(
          name: RouteList.wardPage,
          page: const WardPage(),
        ),
        getPage(
          name: RouteList.villagePage,
          page: const VillagePage(),
        ),
      ];
}

GetPage getPage(
        {required String name, required Widget page, Bindings? bindings}) =>
    GetPage(name: name, page: () => page, binding: bindings);
