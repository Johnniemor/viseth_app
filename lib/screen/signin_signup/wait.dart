import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/Home.dart';

class Wait extends StatelessWidget {
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
            const SizedBox(height: 20),
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
                children: const [
                  Text(
                    "ກະລຸນາລໍຖ້າ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                  Text(
                    "ການກວດສອບຂໍ້ມູນ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                  Text(
                    "ປະມານ 3-4 ວັນ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "ຂໍຂອບໃຈ!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 30),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homescreen(),
                  ),
                );
              },
              child: Container(
                //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                decoration: const BoxDecoration(
                    color: colorRed,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    "ກັບຄືນສູ່ໜ້າຫຼັກ",
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
