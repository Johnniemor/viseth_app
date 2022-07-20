import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rescue_project_app/callapi/callapi.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/stuff/staff.dart';
import 'package:rescue_project_app/screen/use/api/accident/controller.dart';
import 'package:rescue_project_app/screen/use/api/accident/widget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget {
  final requestID;
  const Detail({
    Key? key,
    required this.requestID,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  HospitalController hospitalController = Get.put(HospitalController());
  var currentSelectedValueHospital;
  String idhospital = '';

  TextEditingController _description = TextEditingController();
  // This widget is the root of your application.

  _insertData(BuildContext context) async {
    showDialog(
        context: context,
        builder: (ali) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Container(
                alignment: Alignment.center,
                width: 400,
                height: 100,
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('ກຳລັງດຳເນີນການ')
                  ],
                ),
              ),
            ));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('id').toString();
    var data = {
      'request_id': widget.requestID.toString(),
      'user_id': userID.toString(),
      'hospital_id': idhospital.toString(),
      'description': _description.text.toString()
    };

    var res = await CallApi().postData(data, 'accident');
    var respone = jsonDecode(res.body);
    print(respone);
    print('Response status: ${res.statusCode}');
    if (res.statusCode == 200) {
      Future.delayed(Duration(seconds: 3),(){
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (Ali) => Staff()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List.generate(
        hospitalController.statetList.length,
        (index) => hospitalController.statetList[index].hospitalname ==
                currentSelectedValueHospital
            ? setState(() {
                idhospital =
                    hospitalController.statetList[index].id!.toString();
                print(idhospital);
              })
            : null);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Staff()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ແຈ້ງອຸບັດຕິເຫດ"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Flexible(
                    child: Center(
                      child: Text(
                        'ການເກັບກຳຂໍ້ມູນຂອງອຸບັດຕິເຫດ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ' ສົ່ງໂຮງໝໍ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              // const TextField(
              //   keyboardType: TextInputType.text,
              //   textInputAction: TextInputAction.done,
              //   decoration: InputDecoration(border: OutlineInputBorder()),
              // ),
              selectHospital(width),
              const SizedBox(height: 10),
              const Text(
                'ລາຍລະອຽດຂອງອຸບັດຕິເຫດ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              TextField(
                controller: _description,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  _insertData(context);
                },
                child: Container(
                  //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  decoration: const BoxDecoration(
                      color: colorBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "ບັນທຶກ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container selectHospital(double width) {
    return Container(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: const InputDecoration(
                  fillColor: Color(0xFFF4F6FB),
                  filled: true,
                  border: InputBorder.none),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'nsl_bold',
                      color: Colors.grey.shade800),
                  hint: Text(
                    'ເລືອກໂຮງໝໍ',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'nsl_bold',
                        color: Colors.grey.shade600),
                  ),
                  value: currentSelectedValueHospital,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      currentSelectedValueHospital = newValue;
                    });
                    print(currentSelectedValueHospital);
                  },
                  items: hospital.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
