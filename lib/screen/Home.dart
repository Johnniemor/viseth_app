import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/image_picker.dart';
import 'package:rescue_project_app/screen/signin_signup/signin.dart';
import 'package:rescue_project_app/screen/signin_signup/signup.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 10, 150),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                "assets/images/logo1.png",
                width: size.width * 0.4,
              ),
            ),
            const SizedBox(height: 12.5),
            const Text(
              "EMR Ambulance App",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Times New Roman',
                  fontSize: 20),
            ),
            const Text(
              "ແອັບແຈ້ງອຸບັດຕິເຫດ",
              style: TextStyle(
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    "ສະບາຍດີ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 40),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 200.0,
                      height: 60.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(colorRed),
                        ),
                        child: const Text(
                          'ສະໝັກສະມາຊິກ',
                          style: TextStyle(fontSize: 20),
                        ),
                        //icon: Icon(Icons.add),
                        //label: const Text("ສະໝັກສະມາຊິກ",
                        //    style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 200.0,
                      height: 60.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(colorLightRed),
                        ),
                        //icon: Icon(Icons.login),
                        //label: const Text("ເຂົ້າສູ່ລະບົບ",
                        child: const Text(
                          'ເຂົ້າສູ່ລະບົບ',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.2),
            const Text(
              "Soutsaka Institute of ",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 126, 135, 255)),
            ),
            const Text(
              "Technology",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 126, 135, 255)),
            ),
          ],
        ),
      ),
    );
  }
}
