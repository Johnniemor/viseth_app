import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/use/use.dart';

class Follow extends StatelessWidget {
  Follow({Key? key}) : super(key: key);

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
          title: const Text("ຕິດຕາມອຸບັດຕິເຫດ"),
        ),
        body: SafeArea(
          child: Stack(children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))),
                child: ListView(
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
                            ' ຜູ້ແຈ້ງອຸບັດຕິເຫດ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          TextField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            ' ເບີໂທສຸກເສີນ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            ' ເວລາການແຈ້ງເຫດ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          TextField(
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.done,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            ' ເວລາການຮັບແຈ້ງເຫດ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
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
                            ' ສູນກູ້ໄພ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
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
                            ' ຜູ້ຮັບຜິດຊອບ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
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
                            ' ສົ່ງໂຮງໝໍ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          TextField(
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.done,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Use(),
                          ),
                        );
                      },
                      child: Container(
                        //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        decoration: const BoxDecoration(
                          color: colorRed,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
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
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.18,
                          top: MediaQuery.of(context).size.height * 0.08),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
