import 'package:get/state_manager.dart';
import 'package:rescue_project_app/screen/use/api/accident/model.dart';
import 'package:rescue_project_app/screen/use/api/accident/service.dart';

class HospitalController extends GetxController {
  var isLoading = true.obs;
  var statetList = <Hospital>[].obs;

  @override
  void onInit(){
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var hospital = await RemoteServiceHospital.fetchCategories();
      if (hospital != null) {
        statetList.value = hospital;
      }
    } finally {
      isLoading(false);
    }
  }
}