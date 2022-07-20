import 'package:get/state_manager.dart';
import 'package:rescue_project_app/screen/use/api/history_models.dart';
import 'package:rescue_project_app/screen/use/api/history_service.dart';
import 'package:rescue_project_app/screen/use/request/request_models.dart';
import 'package:rescue_project_app/screen/use/request/request_service.dart';

class HistoryStaffController extends GetxController {
  var isLoading = true.obs;
  var statetList = <HistoryStaff>[].obs;

  @override
  void onInit(){
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var history = await RemoteServiceHistoryStaff.fetchCategories();
      if (history != null) {
        statetList.value = history;
      }
    } finally {
      isLoading(false);
    }
  }
}