import 'package:get/get.dart';
import 'package:grievance_portal/presentation/pages/dashboard_page/controller/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
