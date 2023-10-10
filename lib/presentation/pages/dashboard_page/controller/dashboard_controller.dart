import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grievance_portal/app/core/api_client.dart';
import 'package:grievance_portal/app/core/api_const.dart';
import 'package:grievance_portal/app/models/total_grievance_model.dart';
import 'package:grievance_portal/utils/dbkeys.dart';

class DashboardController extends GetxController {
  final ApiClient _apiClient = Get.find();
  Rxn<TotalGrievanceModel> totalGrievance = Rxn<TotalGrievanceModel>();

  DateTime current = DateTime.now();
  late Stream<DateTime> timer;

  @override
  void onInit() {
    timer = Stream.periodic(const Duration(seconds: 1), (i) {
      current = current.add(const Duration(seconds: 1));
      return current;
    });
    super.onInit();
  }

  @override
  void onReady() {
    getTotalGrievance();
    super.onReady();
  }

  Future<void> getTotalGrievance() async {
    var totalJson = await _apiClient.put(
        path: ApiConst.wsGetTotalRequestsByUser,
        formData: {ApiConst.userId: GetStorage().read(DbKeys.userId)});

    if (totalJson != null) {
      totalGrievance.value = TotalGrievanceModel.fromJson(totalJson);
    }
  }
}
