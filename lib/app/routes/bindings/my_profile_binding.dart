import 'package:get/get.dart';
import 'package:grievance_portal/presentation/pages/my_profile_page/controller/my_profile_controller.dart';

class MyProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MyProfileController());
  }
}
