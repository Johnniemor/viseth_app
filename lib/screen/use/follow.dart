import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';

import 'package:rescue_project_app/screen/use/use.dart';

import '../../widget/app_drawer.dart';

class Follow extends StatelessWidget {
  const Follow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Use()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ຕິດຕາມສະຖານະການ"),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 229, 224, 224),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 30),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage('assets/images/car.gif'),
                      ),
                      color: colorBlue,
                    ),
                    alignment: Alignment.topRight,
                    child: const Icon(Icons.location_on,
                        color: Colors.red, size: 50),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: colorLightBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '             ຊື່ຜູ້ແຈ້ງ',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '             ເບີໂທ',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '             ໜ່ວຍກູ້ໄພ',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '             ໂຮງໝໍ',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '             ເວລາແຈ້ງເຫດ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
