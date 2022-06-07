import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/image_picker.dart';
import 'package:rescue_project_app/screen/signin_signup/signin.dart';
import 'package:rescue_project_app/screen/signin_signup/signup.dart';

class last1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 5,
        title: const Text("ລົງທະບຽນ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const SizedBox(height: 12.5),
            const Text(
              "ການສະໝັກສະມາຊິກ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 30),
            ),
            const Text(
              "ເກືອບຈະສຳເລັດແລ້ວ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 30),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              decoration: BoxDecoration(
                color: colorRed,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    "ກະລຸນາລໍຖ້າ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                  const Text(
                    "ການກວດສອບຂໍ້ມູນ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                  const Text(
                    "ປະມານ 3-4 ວັນ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "ຂໍຂອບໃຈ!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 30),
            ),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
