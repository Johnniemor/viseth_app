import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rescue_project_app/screen/use/api/controller_history.dart';
import 'package:rescue_project_app/screen/use/api/history_models.dart';
import 'package:rescue_project_app/screen/use/detail_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  var resdata;
  String resdatastatus = '';

  HistoryController historyController = Get.put(HistoryController());
  var outputFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('ປະຫວັດການແຈ້ງ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            history(context, width,historyController.statetList.where((p0) => p0.rcenterName.toString()=='Center1' || p0.rcenterName.toString() == 'Center2').toList())
          ],
        ),
      ),
    );
  }

  Obx history(BuildContext context, double width,List<History>history) {
    return Obx(() {
            if (historyController.isLoading.value){
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
                                    builder: (Ali) => DetailHistoryScreen(
                                        idHistory: history[index].id
                                            .toString(), imagehis: history[index].rqimage, rqtime: history[index].createdAt,)));
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
                                        borderRadius:
                                            BorderRadius.circular(7),
                                        color: Colors.grey.shade500,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(7),
                                        child: Image.network(history[index].rqimage.toString(),fit: BoxFit.cover,)),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('ເວລາການແຈ້ງ: ' +
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
                                        Text('ເວລາການຮັບ: ' +
                                            history[index].comfirmedAt
                                            .toString(),style: TextStyle(fontSize: 12)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text('ສູນທີ່ຮັບ: ' + 
                                            history[index].rcenterName
                                            .toString(),style: TextStyle(fontSize: 12)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text('ລາຍລະອຽດ: ' + 
                                            history[index].rqdescription
                                            .toString(),style: TextStyle(fontSize: 12)),
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
