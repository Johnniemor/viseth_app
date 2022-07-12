import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rescue_project_app/callapi/callapi.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/wait.dart';
import 'package:rescue_project_app/screen/stuff/staff.dart';
import 'package:rescue_project_app/screen/use/use.dart';
import 'package:rescue_project_app/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  String status = '';

  _login(BuildContext context) async {
    String role = '';
    var data = {
      'tel': username.text,
      'password': password.text,
    };

    var res = await CallApi().postData(data, 'login');
    var respone = jsonDecode(res.body);
    print(respone);
    print('Response status: ${res.statusCode}');
    if (res.statusCode == 201) {
      setState(() {
        role = respone['user_role'].toString();
        status = respone['user']['status'].toString();
        print('role====> ' + role);
      });
      if (role == 'user') {
         if(status =='verified'){
           SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('id', respone['user']['id'].toString());
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (Ali) => Use()));
         }else{
          showdialog(context, 'ຂໍ້ມູນຂອງທ່ານຍັງບໍ່ຮັບການຢືນຢັນ\n                 ກະລຸນາລໍຖ້າ');
         }
      } else {
        if (role == 'staff1' || role == 'staff2') {
          if(status =='verified'){
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (Ali) => Staff()));
         }else{
          showdialog(context, 'ຂໍ້ມູນຂອງທ່ານຍັງບໍ່ຮັບການຢືນຢັນ\n                 ກະລຸນາລໍຖ້າ');
         }
        }
      }
    }
    ;
    var body = json.decode(res.body);
    print(body);
  }

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
        title: const Text("ເຂົ້າສູ່ລະບົບ"),
      ),
      // endDrawer: const AppDrawer(),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
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
                    textEditingController: username,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFieldPassword(
                    headerText: "ລະຫັດ",
                    hintTexti: "ລະຫັດຜ່ານ",
                    textEditingController: password,
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () async {
                      if (username.text.length.toInt() == 0 &&
                          password.text.length.toInt() == 0) {
                        showdialog(context, 'ກະລູນາປ້ອນເບີໂທ ແລະ ລະຫັດຜ່ານ');
                      } else {
                        if (username.text.length.toInt() == 0) {
                          showdialog(context, 'ກະລູນາປ້ອນເບີໂທ');
                        } else {
                          if (password.text.length.toInt() == 0) {
                            showdialog(context, 'ກະລູນາປ້ອນລະຫັດຜ່ານ');
                          } else {
                            
                              _login(context);
                          
                          }
                        }
                      }
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
                          "ເຂົ້າສູ່ລະບົບ",
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
          ),
        ],
      )),
    );
  }

  Future<dynamic> showdialog(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Container(
                alignment: Alignment.center,
                width: 300,
                height: 130,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      size: 50,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child: Text(text, style: TextStyle(fontSize: 20))),
                  ],
                ),
              ),
            ));
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
        children: [
          Checkbox(
              value: isCheck,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
              text: "ຈົດຈຳລະຫັດຜ່ານ",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  TextEditingController textEditingController;
  InputField(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.textEditingController})
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
                color: Color.fromARGB(255, 1, 1, 1),
                fontSize: 22,
                fontWeight: FontWeight.w500),
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
                controller: textEditingController,
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
  TextEditingController textEditingController;

  InputFieldPassword(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.textEditingController})
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
              controller: widget.textEditingController,
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

class TopSginin extends StatelessWidget {
  const TopSginin({
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
            "Sign In",
            style: TextStyle(color: colorBlue, fontSize: 25),
          )
        ],
      ),
    );
  }
}
