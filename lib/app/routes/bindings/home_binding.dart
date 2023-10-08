import 'package:get/get.dart';
import 'package:grievance_portal/presentation/pages/home_page/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
