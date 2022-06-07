import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/stuff/LocationRS.dart';
import 'package:rescue_project_app/screen/stuff/rstest.dart';

class Detail extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).setState(() {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => GetLocationPage()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ແຈ້ງອຸບັດຕິເຫດ"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Flexible(
                    child: Center(
                      child: Text(
                        'ການເກັບກຳຂໍ້ມູນຂອງອຸບັດຕິເຫດ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ' ຊື່ຜູ້ແຈ້ງອຸບັດຕິເຫດ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left,
              ),
              const TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' ເບີໂທສຸກເສີນ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' ເວລາການແຈ້ງເຫດ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' ເວລາການຮັບແຈ້ງເຫດ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' ສູນກູ້ໄພ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' ພະນັກງານຜູ້ຮັບຜິດຊອບ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' ສົ່ງໂຮງໝໍ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              const Text(
                'ລາຍລະອຽດຂອງອຸບັດຕິເຫດ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' ເວລາການກູ້ໄພສຳເລັດ ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const TextField(
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetLocationPage()));
                },
                child: Container(
                  //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  decoration: const BoxDecoration(
                      color: colorBlue,
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
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
