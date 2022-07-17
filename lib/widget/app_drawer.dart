import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/Home.dart';
import 'package:rescue_project_app/screen/signin_signup/showpftest.dart';
import 'package:rescue_project_app/screen/use/api/controller_history.dart';
import 'package:rescue_project_app/screen/use/api/recent.dart';
import 'package:rescue_project_app/screen/use/history.dart';
import 'package:get/get.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  HistoryController historyController = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // DrawerHeader(
          //   // decoration: BoxDecoration(
          //   //   color: colorBlue,
          //   // ),
          //   child: CircleAvatar(
          //     child: Image.asset(
          //       "assets/images/logo1.png",
          //     ),
          //   ),
          // ),

          // ListTile(
          //   leading: Icon(Icons.person),
          //   iconColor: colorBlue,
          //   title: const Text('ຂໍ້ມູນສ່ວນຕົວ'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => Showuser(),
          //       ),
          //     );
          //   },
          // ),

          ListTile(
            leading: Icon(Icons.report),
            iconColor: colorBlue,
            title: const Text('ແຈ້ງເຫດລ່າສຸດ'),
            
            onTap: () {
              historyController.onInit();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Recent(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.library_books_sharp,
            ),
            iconColor: colorBlue,
            title: const Text('ປະຫວັດການແຈ້ງອຸບັດຕິເຫດ'),
            onTap: () {
              historyController.onInit();
              Navigator.push(context,
                  MaterialPageRoute(builder: (Ali) => HistoryScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_sharp,
            ),
            iconColor: colorBlue,
            title: const Text('ອອກຈາກລະບົບ'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homescreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
