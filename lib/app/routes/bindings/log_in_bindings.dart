import 'package:get/get.dart';
import 'package:grievance_portal/presentation/pages/log_in_page/controller/log_in_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LogInController());
  }
}
