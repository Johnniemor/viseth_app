import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/signin.dart';
import 'package:rescue_project_app/screen/signin_signup/signup2.dart';
import 'package:rescue_project_app/screen/signin_signup/imagepick.dart';
import 'package:rescue_project_app/screen/signin_signup/wait.dart';
import 'package:rescue_project_app/widget/app_drawer.dart';

class showpf extends StatelessWidget {
  showpf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 5,
        title: Text("ລົງທະບຽນ"),
      ),
      endDrawer: AppDrawer(),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  Image.asset(
                    'assets/images/logo1.png',
                    height: 150,
                    width: 150,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          ' ຊື່ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ນາມສະກຸນ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ເພດ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ວັນເດືອນປີເກີດ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' ເບີໂທ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' ບ້ານ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' ເມືອງ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' ແຂວງ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => last1(),
                        ),
                      );
                    },
                    child: Container(
                      //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      decoration: const BoxDecoration(
                        color: colorRed,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "ຕໍ່ໄປ",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.10,
                        top: MediaQuery.of(context).size.height * 0.09),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
