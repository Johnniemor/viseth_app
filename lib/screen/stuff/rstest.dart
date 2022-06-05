import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:rescue_project_app/screen/stuff/category_card.dart';
import 'package:rescue_project_app/screen/stuff/rescue.dart';
import 'package:rescue_project_app/widget/app_drawer.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.deepPurple[300],
        elevation: 5,
        title: const Text("ລົງທະບຽນ"),
      ),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       //name
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: const [
            //           Text(
            //             "STAFF",
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 25,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 8,
            //           ),
            //           Text(
            //             "  Amiw",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 20),
            //           ),
            //         ],
            //       ),

            //       //profile picture

            //       //amination or cute picture
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(50),
            //         child: Image.asset(
            //           'assets/images/pf.png',
            //           height: 70,
            //           width: 70,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
                          // Container(
                          //   padding: EdgeInsets.all(12),
                          //   decoration: BoxDecoration(
                          //       color: Colors.deepPurple[300],
                          //       borderRadius: BorderRadius.circular(12)),
                          //   child: const Center(
                          //     child: Text(
                          //       'Get Started',
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 25),

            //search bar
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //   child: Container(
            //     padding: EdgeInsets.all(12),
            //     decoration: BoxDecoration(
            //         color: Colors.deepPurple[100],
            //         borderRadius: BorderRadius.circular(12)),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         prefixIcon: Icon(Icons.search),
            //         border: InputBorder.none,
            //         hintText: 'How can we help you?',
            //       ),
            //     ),
            //   ),
            // ),

            // SizedBox(height: 25),

            //horuzontal listview -> categories: detist, surgeon etc...

            // Container(
            //   height: 80,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       CategoryCard(
            //         categoryName: 'Dentist',
            //         iconImagePath: 'assets/images/logo1.png',
            //       ),
            //       CategoryCard(
            //         categoryName: 'Surgeon',
            //         iconImagePath: 'assets/images/logo1.png',
            //       ),
            //       CategoryCard(
            //         categoryName: 'Phramacist',
            //         iconImagePath: 'assets/images/logo1.png',
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(height: 25),

            //doctor list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rescue list',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
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
    );
  }
}
