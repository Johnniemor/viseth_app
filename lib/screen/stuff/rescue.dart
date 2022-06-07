import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/stuff/Home2.dart';
import 'package:rescue_project_app/screen/stuff/picR.dart';
import 'package:rescue_project_app/screen/use/pic.dart';

class RescueCard extends StatelessWidget {
  final String rescueImagePath;

  final String tel;

  RescueCard({
    required this.rescueImagePath,
    required this.tel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 10.0,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 20, top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorBlue.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  tel,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 70,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xfff0CA789)),
                  ),
                  child: const Text(
                    'ຮັບ',
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PicR()));
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 70,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color(0xfffF24726).withOpacity(0.8)),
                  ),
                  child: const Text(
                    'ສົ່ງຕໍ່',
                    style: TextStyle(fontSize: 17),
                  ),
                  //icon: Icon(Icons.add),
                  //label: const Text("ສະໝັກສະມາຊິກ",
                  //    style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
