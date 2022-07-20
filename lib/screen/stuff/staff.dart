import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rescue_project_app/screen/use/api/controller_history.dart';
import 'package:rescue_project_app/screen/use/api/history_models.dart';
import 'package:rescue_project_app/screen/use/detail_history.dart';
import 'package:get/get.dart';
import 'package:rescue_project_app/screen/use/request/controller_request.dart';
import 'package:rescue_project_app/screen/use/request/request_models.dart';
import 'package:rescue_project_app/screen/use/request_detail.dart';
import 'package:rescue_project_app/widget/app_drawer.dart';
import 'package:rescue_project_app/widget/app_drawer_staff.dart';

class Staff extends StatefulWidget {
  const Staff({Key? key}) : super(key: key);

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  void initState() {
    super.initState();
  }

  var resdata;
  String resdatastatus = '';

  HistoryStaffController historyStaffController =
      Get.put(HistoryStaffController());
  var outputFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('ພະນັກງານກູ້ໄພ'),
        centerTitle: true,
      ),
      endDrawer: const AppDrawer2(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            history(
                context,
                width,
                historyStaffController.statetList
                    .where((p0) =>
                        p0.rcenterName.toString() == 'Center1' ||
                        p0.rcenterName.toString() == 'Center2')
                    .toList()),
          ],
        ),
      ),
    );
  }

  Obx history(BuildContext context, double width, List<HistoryStaff> history) {
    return Obx(() {
      if (historyStaffController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: List.generate(
              history.length,
              (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (Ali) => RequestDetailScreen(
                                    idHistory: history[index].id.toString(),
                                    imagehis: history[index].rqimage,
                                    rqtime: history[index].createdAt,
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.grey.shade500,
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image.network(
                                      history[index].rqimage.toString(),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'ເວລາການແຈ້ງ: ' +
                                          DateTime.parse(
                                                  history[index].createdAt!)
                                              .toLocal()
                                              .toString()
                                              .substring(
                                                  0,
                                                  DateTime.parse(history[index]
                                                              .createdAt!)
                                                          .toLocal()
                                                          .toString()
                                                          .length -
                                                      4),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                      'ເວລາການຮັບ: ' +
                                          history[index].comfirmedAt.toString(),
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                      'ສູນທີ່ຮັບ: ' +
                                          history[index].rcenterName.toString(),
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                      'ລາຍລະອຽດ: ' +
                                          history[index]
                                              .rqdescription
                                              .toString(),
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
        );
      }
    });
  }
}
