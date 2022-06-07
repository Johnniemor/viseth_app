import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/signin.dart';
import 'package:rescue_project_app/screen/signin_signup/signup2.dart';
import 'package:rescue_project_app/screen/signin_signup/imagepick.dart';
import 'package:rescue_project_app/screen/stuff/rescue.dart';
import 'package:rescue_project_app/widget/app_drawer.dart';

class test1 extends StatelessWidget {
  test1({Key? key}) : super(key: key);

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
          child: Stack(children: [
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
                    SizedBox(height: 25),

                    //card -> how do you feel?

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            //amination or cute picture
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                'assets/images/pf.png',
                              ),
                            ),

                            SizedBox(width: 20),

                            //how do you feel + get started button

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'ນາງ ເອມິ້ວ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'ໜ້າທີ່: ຮັບສາຍໂທລະສັບ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'ບ່ອນປະຈຳການ: ຈຸດດົງໂດກ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'ມູນລະນິທິ: 1624',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    SizedBox(height: 25),

                    //doctor list
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'ອຸບັດຕິເຫດ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),

                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          RescueCard(
                            rescueImagePath: 'assets/images/logo1.png',
                            tel: '020 54867757',
                          ),
                          RescueCard(
                            rescueImagePath: 'assets/images/logo1.png',
                            tel: '020 92241255',
                          ),
                          RescueCard(
                            rescueImagePath: 'assets/images/logo1.png',
                            tel: '020 52005099',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
