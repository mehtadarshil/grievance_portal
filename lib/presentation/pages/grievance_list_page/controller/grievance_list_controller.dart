import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/models/grievance_detail_model.dart';
import 'package:grievance_portal/app/models/grievence_complete_detail_model.dart';
import 'package:grievance_portal/app/models/grievence_email_history_model.dart';
import 'package:grievance_portal/app/models/grievence_history_model.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/grievance_email_history.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/grievence_detail_page.dart';
import 'package:grievance_portal/presentation/pages/grievance_list_page/grievence_history_page.dart';
import 'package:grievance_portal/utils/dbkeys.dart';
import 'package:grievance_portal/utils/dialog_util.dart';

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

  void getGrievenceHistory(String id) async {
    final historyJson = await _apiClient.put(
        path: ApiConst.wsGetGrievanceHistoryByGrievanceid,
        formData: {ApiConst.grievanceId: id});
    if (historyJson != null) {
      var grievanceHistory = GrievenceHistoryModel.fromJson(historyJson);
      if (grievanceHistory.status!) {
        Get.to(() => GrievenceHistory(data: grievanceHistory));
      }
    }
  }

  void getGrievenceEmailHistory({required String grievenceId}) async {
    final historyJson = await _apiClient
        .put(path: ApiConst.wsGetGrievanceEmailHistoryByUser, formData: {
      ApiConst.userId: GetStorage().read(DbKeys.userId),
      ApiConst.grievanceId: grievenceId
    });
    if (historyJson != null) {
      var grievanceEmailHistory =
          GrievenceEmailHistoryModel.fromJson(historyJson);
      if (grievanceEmailHistory.status!) {
        Get.to(() => GrievenceEmailHisoryPage(data: grievanceEmailHistory));
      } else {
        DialogUtil.customDialog(title: "Failed".tr, error: true);
      }
    }
  }

  void getDetailedGrievence({required String grievenceId}) async {
    final detailJson = await _apiClient.put(
        path: ApiConst.wsGetGrievanceDetailsById,
        formData: {ApiConst.grievanceId: grievenceId});
    if (detailJson != null) {
      var grievanceDetail = GrievenceCompleteDetailModel.fromJson(detailJson);
      if (grievanceDetail.status!) {
        Get.to(() => GrievenceDetailPage(data: grievanceDetail));
      }
    }
  }
}
