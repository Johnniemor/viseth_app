import 'package:get/state_manager.dart';
import 'package:rescue_project_app/screen/use/api/history_models.dart';
import 'package:rescue_project_app/screen/use/api/history_service.dart';

class HistoryController extends GetxController {
  var isLoading = true.obs;
  var statetList = <History>[].obs;

  @override
  void onInit(){
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var history = await RemoteServiceHistory.fetchCategories();
      if (history != null) {
        statetList.value = history;
      }
    } finally {
      isLoading(false);
    }
  }
}