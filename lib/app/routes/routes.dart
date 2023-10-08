import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grievance_portal/app/routes/bindings/dashboard_binding.dart';
import 'package:grievance_portal/app/routes/bindings/home_binding.dart';
import 'package:grievance_portal/app/routes/route_list.dart';
import 'package:grievance_portal/presentation/pages/dashboard_page/dashboard_page.dart';
import 'package:grievance_portal/presentation/pages/home_page/home_page.dart';

class Routes {
  static List<GetPage<dynamic>> getRoutes() => [
        getPage(
            name: RouteList.homePage,
            page: const HomePage(),
            bindings: HomeBinding()),
        getPage(
            name: RouteList.dashboard,
            page: const DashboardPage(),
            bindings: DashboardBindings())
      ];
}

GetPage getPage(
        {required String name, required Widget page, Bindings? bindings}) =>
    GetPage(name: name, page: () => page, binding: bindings);
