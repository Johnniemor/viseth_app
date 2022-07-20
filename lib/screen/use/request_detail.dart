import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/stuff/detail.dart';
import 'package:rescue_project_app/screen/use/api/accident/widget.dart';
import 'package:rescue_project_app/screen/use/detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestDetailScreen extends StatefulWidget {
  final String idHistory;
  final imagehis;
  final rqtime;
  const RequestDetailScreen(
      {Key? key,
      required this.idHistory,
      required this.imagehis,
      required this.rqtime})
      : super(key: key);

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreen();
}

class _RequestDetailScreen extends State<RequestDetailScreen> {
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

  var currentSelectedValueHospital;

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

  double lat = 0.0;
  double lng = 0.0;

  static Future<void> openMap(double lat, double lng) async {
    await launchUrl(
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng'));
  }

  Future<List<Details>?> data() async {
    var response = await client.get(
        Uri.parse('http://10.0.2.2:8000/api/showdetail/${widget.idHistory}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      setState(() {
        lat = double.parse(jsonDecode(response.body)[0]['rqlat'].toString());
        lng = double.parse(jsonDecode(response.body)[0]['rqlng'].toString());
      });
      print(lat);
      print(lng);
      print(jsonString);

      return historyFromJson(response.body).where((element) => element.id!.toString()== widget.idHistory.toString()).toList();
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
                                Text(
                                  'ກຳລັງດຳເນີນການ',
                                  style: TextStyle(),
                                ),
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
                                Text('ມີສູນກູ້ໄພຮັບແລ້ວ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
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
                                    DateTime.parse(statetList[0].createdAt!)
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
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                openMap(lat, lng);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                decoration: const BoxDecoration(
                                    color: colorBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: Text(
                                    "ສະແດງຕໍາແໜ່ງ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(requestID:statetList[0].id.toString() ,)));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(4, 131, 184, .1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: Text(
                                    "ບັນທຶກອຸບັດຕິເຫດ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
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
