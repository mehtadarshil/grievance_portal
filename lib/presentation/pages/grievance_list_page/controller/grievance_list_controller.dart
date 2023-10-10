import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/models/grievance_detail_model.dart';
import 'package:grievance_portal/utils/dbkeys.dart';

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
        formData: {ApiConst.userId: GetStorage().read(DbKeys.userId)});
    if (grievanceListJson != null) {
      grievanceDetails.value = GrievanceDetails.fromJson(grievanceListJson);
    }
  }
}
