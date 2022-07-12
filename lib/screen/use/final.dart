import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/use/use.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Complete extends StatefulWidget {
  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {

  var resdata;
  String resdatastatus = '';

  Future<void> data() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    final response = await http.get(
        Uri.parse(
            'http://10.0.2.2:8000/api/order/show/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    
  }
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
        title: const Text("ແຈ້ງອຸບັດຕິເຫດ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
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
                    "ການແຈ້ງອຸບັດຕິເຫດ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                  Text(
                    "ຂອງທ່ານ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                  Text(
                    "ສຳເລັດແລ້ວ",
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Times New Roman',
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              "ຂໍຂອບໃຈ!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 30),
            ),
            SizedBox(height: size.height * 0.2),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Use()));
                print("Back");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: const BoxDecoration(
                    color: colorRed,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    "ກັບຄືນສູ່ໜ້າຫຼັກ",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 229, 224, 224)),
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
