import 'package:get/get.dart';
import 'package:rescue_project_app/screen/use/api/accident/controller.dart';

HospitalController hospitalController = Get.put(HospitalController());

List<String> hospital = List.generate(hospitalController.statetList.length,
    (index) =>hospitalController.statetList[index].hospitalname.toString());
