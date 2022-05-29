import 'package:flutter/material.dart';
import 'package:rescue_project_app/screen/signin_signup/signup.dart';

import '../../constant/constant.dart';
import '../../widget/app_drawer.dart';

class SignIn2 extends StatelessWidget {
  const SignIn2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorRed,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text("ຢືນຢັນຕົວຕົນ"),
      ),
      endDrawer: AppDrawer(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: size.height * 0.010),
          const Text(
            "EMR Ambulance App",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Times New Roman',
                fontSize: 25),
          ),
          const Text(
            "ແອັບແຈ້ງອຸບັດຕິເຫດ",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Times New Roman',
                fontSize: 20),
          ),
        ]),
      ),
    );
  }
}
