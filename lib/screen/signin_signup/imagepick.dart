import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/showpftest.dart';
import 'package:rescue_project_app/screen/signin_signup/signup.dart';

class Userconfirm extends StatefulWidget {
  const Userconfirm({Key? key}) : super(key: key);

  @override
  _UserconfirmState createState() => _UserconfirmState();
}

class _UserconfirmState extends State<Userconfirm> {
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignUp()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ຢືນຢັນຕົວຕົນ"),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ກະລຸນາຖ່າຍຮູບຂອງທ່ານ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 30),
                  ),
                  const Text(
                    "ເພື່ອຢືນຢັນຕົວຕົນ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        //fontFamily: 'Times New Roman',
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _image != null
                      ? Image.file(
                          _image!,
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/profilecard.png",
                          width: size.width * 3.0,
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 115.0,
                      height: 70.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(colorRed),
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 50,
                        ),
                        //icon: Icon(Icons.add),
                        //label: const Text("ສະໝັກສະມາຊິກ",
                        //    style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Showuser()));
                    },
                    child: Container(
                      //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
        ],
      ),
    ),
  );
}
