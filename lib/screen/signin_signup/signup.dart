import 'package:flutter/material.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/imagepick.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController birthday = TextEditingController();
  //TextEditingController gender = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController village = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
          child: Stack(
        children: [
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
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    headerText: "ຊື່",
                    hintTexti: "ຊື່",
                    controller: name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    headerText: "ນາມສະກຸນ",
                    hintTexti: "ນາມສະກຸນ",
                    controller: surname,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownBTN(),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    headerText: "ວັນເດືອນປີເກີດ",
                    hintTexti: "ວັນ/ເດືອນ/ປີເກີດ",
                    controller: birthday,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    headerText: "ເບີໂທ",
                    hintTexti: "ເບີໂທ",
                    controller: tel,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    headerText: "ບ້ານ",
                    hintTexti: "ບ້ານຢູ່ປັດຈຸບັນ",
                    controller: village,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    headerText: "ເມືອງ",
                    hintTexti: "ເມືອງຢູ່ປັດຈຸບັນ",
                    controller: district,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    headerText: "ແຂວງ",
                    hintTexti: "ແຂວງຢູ່ປັດຈຸບັນ",
                    controller: province,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFieldPassword(
                    headerText: "ລະຫັດ",
                    hintTexti: "ລະຫັດ",
                    controller: password,
                  ),
                  const CheckerBox(),
                  InkWell(
                    onTap: () {
                      print(name.text);
                      print(surname.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Userconfirm(),
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
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.18,
                        top: MediaQuery.of(context).size.height * 0.08),
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

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  TextEditingController controller;

  InputField(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            //ສີຢູ່ທາງໃນບ່ອນໃສ່ຊື່ ແລະ ເມວ
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: colorRed.withOpacity(0.2),
              // border: Border.all(
              //   width: 1,
              // ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
              ),
            )
            //IntrinsicHeight

            ),
      ],
    );
  }
}

class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;
  TextEditingController controller;

  InputFieldPassword(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.controller})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: colorRed.withOpacity(0.2),
            // border: Border.all(
            //   width: 1,
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              obscureText: _visible,
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}

class TopSginup extends StatelessWidget {
  const TopSginup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.arrow_back_sharp,
            color: colorLightRed,
            size: 40,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Sign up",
            style: TextStyle(color: colorLightRed, fontSize: 25),
          )
        ],
      ),
    );
  }
}

class DropdownBTN extends StatefulWidget {
  @override
  State<DropdownBTN> createState() => _DropdownBTNState();
}

class _DropdownBTNState extends State<DropdownBTN> {
  //TextEditingController shift=TextEditingController();
  //String? shift1 = shift.text;
  String? headerText;

  List<String> items = ['ເພດ', 'ຍິງ', 'ຊາຍ'];

  String? selectedItem = 'ເພດ';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headerText = "ເພດ",
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 70,
          margin: const EdgeInsets.only(left: 25, right: 20),
          decoration: BoxDecoration(
              // color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    ),
                iconEnabledColor: colorRed,
                value: selectedItem,
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 17),
                          ),
                        ))
                    .toList(),
                onChanged: (item) => setState(() => selectedItem = item)),
          ),
        ),
      ],
    );
  }
}
