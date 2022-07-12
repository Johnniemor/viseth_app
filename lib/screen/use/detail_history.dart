import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rescue_project_app/screen/stuff/detail.dart';
import 'package:rescue_project_app/screen/use/detail_model.dart';

class DetailHistoryScreen extends StatefulWidget {
  final String idHistory;
  const DetailHistoryScreen({Key? key, required this.idHistory})
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
                      Text(
                        statetList[0].id.toString(),
                      ),
                      statetList[0].status.toString() != 'comfirmed'
                          ? Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('ກຳລັງດຳເນີນການ')
                              ],
                            )
                          : Icon(
                              Icons.check,
                              size: 100,
                              color: Colors.green,
                            )
                    ],
                  ),
                );
              }
            })
          ],
        ),
      )),
    );
  }
}
