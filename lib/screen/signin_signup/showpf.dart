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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 5,
        title: const Text("ລົງທະບຽນ"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                "assets/images/logo1.png",
                width: size.width * 0.4,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Center(
                  //   child: Text(
                  //     ' ຂໍ້ມູນ ',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 30,
                  //         color: Colors.black),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    keyboardType: TextInputType.number,
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
                    keyboardType: TextInputType.datetime,
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
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' ເບີໂທ ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' ບ້ານ ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' ເມືອງ ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' ແຂວງ ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
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
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
