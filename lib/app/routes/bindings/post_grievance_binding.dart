import 'package:get/get.dart';
import 'package:grievance_portal/presentation/pages/post_grievance/controller/post_grievance_controller.dart';

class PostGrievanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PostGrievanceController());
  }
}
