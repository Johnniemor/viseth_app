import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rescue_project_app/screen/use/api/controller_history.dart';
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
            Obx(() {
              if (historyController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: List.generate(
                      historyController.statetList.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (Ali) => DetailHistoryScreen(
                                          idHistory: historyController
                                              .statetList[index].id
                                              .toString())));
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
                                                historyController
                                                    .statetList[index].createdAt
                                                    .toString(),overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12),),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text('ເວລາການຮັບ: ' +
                                              historyController
                                              .statetList[index].comfirmedAt
                                              .toString(),style: TextStyle(fontSize: 12)),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text('ສູນທີ່ຮັບ: ' + 
                                              historyController
                                              .statetList[index].rcenterName
                                              .toString(),style: TextStyle(fontSize: 12)),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text('ລາຍລະອຽດ: ' + 
                                              historyController
                                              .statetList[index].rqdescription
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
            })
          ],
        ),
      ),
    );
  }
}
