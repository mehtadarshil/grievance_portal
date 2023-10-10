import 'package:get/get.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/controller/grievance_list_controller.dart';

class GrievanceListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GrievanceListController());
  }
}
