import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/Home.dart';
import 'package:rescue_project_app/screen/signin_signup/showpftest.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
          ListTile(
            leading: Icon(Icons.person),
            iconColor: colorBlue,
            title: const Text('ຂໍ້ມູນສ່ວນຕົວ'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Showuser(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.library_books_sharp,
            ),
            iconColor: colorBlue,
            title: const Text('ປະວັດການເຂົ້າໃຊ້'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_sharp,
            ),
            iconColor: colorBlue,
            title: const Text('ອອກຈາກລະບົບ'),
            onTap: () {
              Navigator.pushReplacement(
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
