import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';

import 'package:rescue_project_app/screen/use/use.dart';

import '../../widget/app_drawer.dart';

class Follow extends StatelessWidget {
  const Follow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 229, 224, 224),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          alignment: Alignment.topLeft,
                          image: AssetImage('assets/images/car.gif'),
                        ),
                        color: colorBlue,
                      ),
                      alignment: Alignment.topRight,
                      child: const Icon(Icons.location_on,
                          color: Colors.red, size: 50),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: colorLightBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Center(
                          child: Text(
                            ' ຂໍ້ມູນ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ຊື່ຜູ້ແຈ້ງອຸບັດຕິເຫດ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ເບີໂທສຸກເສີນ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ເວລາການແຈ້ງເຫດ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ເວລາການຮັບແຈ້ງເຫດ ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
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
