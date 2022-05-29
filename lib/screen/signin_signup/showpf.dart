import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/image_picker.dart';
import 'package:rescue_project_app/screen/signin_signup/signin.dart';
import 'package:rescue_project_app/screen/signin_signup/signup.dart';
import 'package:rescue_project_app/screen/signin_signup/wait.dart';

class SignIn3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 5,
        title: const Text("ລົງທະບຽນ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo1.png",
                width: size.width * 0.4,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  const Text(
                    "                  ຊື່:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                  const Text(
                    "     ນາມສະກຸນ:",
                    style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                  const Text(
                    "              ເພດ:",
                    style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                  const Text(
                    "ວັນເດືອນປີເກີດ:",
                    style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                  const Text(
                    "             ເບີໂທ:",
                    style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                  const Text(
                    "               ບ້ານ:",
                    style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                  const Text(
                    "              ເມືອງ:",
                    style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                  const Text(
                    "             ແຂວງ:",
                    style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => last1()));
              },
              child: Container(
                //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: const BoxDecoration(
                    color: colorRed,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
          ],
        ),
      ),
    );
  }
}
