import 'package:get/get.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/models/grievance_detail_model.dart';

class GrievanceListController extends GetxController {
  final ApiClient _apiClient = Get.find();
  Rxn<GrievanceDetails> grievanceDetails = Rxn<GrievanceDetails>();

  @override
  void onReady() {
    getGrievanceList();
    super.onReady();
  }

  void getGrievanceList() async {
    var grievanceListJson = await _apiClient.put(
        path: ApiConst.wsGetUserGrievanceList,
        formData: {ApiConst.userId: "1"});
    if (grievanceListJson != null) {
      grievanceDetails.value = GrievanceDetails.fromJson(grievanceListJson);
    }
  }
}
