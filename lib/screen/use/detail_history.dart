import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rescue_project_app/screen/stuff/detail.dart';
import 'package:rescue_project_app/screen/use/detail_model.dart';

class DetailHistoryScreen extends StatefulWidget {
  final String idHistory;
  final imagehis;
  final rqtime;
  const DetailHistoryScreen(
      {Key? key,
      required this.idHistory,
      required this.imagehis,
      required this.rqtime})
      : super(key: key);

  @override
  State<DetailHistoryScreen> createState() => _DetailHistoryScreenState();
}

class _DetailHistoryScreenState extends State<DetailHistoryScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var resdata;
  String resdatastatus = '';
  static var client = http.Client();
  var isLoading = true.obs;
  var statetList = <Details>[].obs;

  void fetchData() async {
    try {
      isLoading(true);
      var history = await data();
      if (history != null) {
        statetList.value = history;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<List<Details>?> data() async {
    var response = await client.get(
        Uri.parse('http://10.0.2.2:8000/api/showrequest/${widget.idHistory}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print(jsonString);

      return historyFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ລາຍລະອຽດ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (isLoading.isTrue) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      statetList[0].status.toString() != 'confirmed'
                          ? Column(
                              children: [
                                SizedBox(height: 20),
                                CircularProgressIndicator(),
                                SizedBox(height: 20),
                                Text('ກຳລັງດຳເນີນການ', style: TextStyle(fontSize: 20))
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(
                                  Icons.check,
                                  size: 100,
                                  color: Colors.green,
                                ),
                                Text('ມີສູນກູ້ໄພຮັບແລ້ວ!',
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                      // : Icon(
                      //     Icons.check,
                      //     size: 100,
                      //     color: Colors.green,
                      //   ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Image.network(
                          widget.imagehis.toString(),
                          fit: BoxFit.cover,
                          width: 200,
                        )),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 10, 20, 10),
                      
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'ລະຫັດການແຈ້ງ: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    statetList[0].id.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    'ເວລາການແຈ້ງ: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    DateTime.parse(
                                              statetList[0].createdAt!)
                                              .toLocal()
                                              .toString()
                                              .substring(
                                                  0,
                                                  DateTime.parse(statetList[0]
                                                              .createdAt!)
                                                          .toLocal()
                                                          .toString()
                                                          .length -
                                                      4),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'ເວລາທີ່ຮັບ: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    statetList[0].comfirmedAt.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'ສູນກູ້ໄພທີ່ຮັບ: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    statetList[0].rcenterName.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'ລາຍລະອຽດເພີມເຕີມ: ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    statetList[0].rqdescription.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ],
        ),
      )),
    );
  }
}
