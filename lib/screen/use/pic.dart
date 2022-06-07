import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/showpf.dart';
import 'package:rescue_project_app/screen/signin_signup/showpftest.dart';
import 'package:rescue_project_app/screen/signin_signup/signin.dart';
import 'package:rescue_project_app/screen/signin_signup/signin2.dart';
import 'package:rescue_project_app/screen/stuff/LocationRS.dart';
import 'package:rescue_project_app/screen/use/final.dart';
import 'package:rescue_project_app/screen/use/location.dart';
import 'package:rescue_project_app/widget/app_drawer.dart';

class Pic extends StatefulWidget {
  const Pic({Key? key}) : super(key: key);

  @override
  _ImagePickerAppState createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<Pic> {
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
                  SizedBox(
                    height: 20,
                  ),
                  _image != null
                      ? Image.file(
                          _image!,
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/accident.png",
                          width: size.width * 3.0,
                        ),
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: colorBlue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ເບີໂທສຸກເສີນຕິດຕໍ່ກັບ',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    color: colorRed,
                    textColor: Colors.white,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 50,
                    ),
                    padding: EdgeInsets.all(35),
                    shape: CircleBorder(),
                  ),
                  InkWell(
                    child: Center(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        buttonPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        buttonHeight: 50,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: colorBlue, width: 2)),
                            child: const Text(
                              "ຍົກເລີກ",
                              style: TextStyle(fontSize: 25),
                            ),
                            textColor: colorBlue,
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: const Text(
                              "ກົດສົ່ງ",
                              style: TextStyle(fontSize: 25),
                            ),
                            textColor: Colors.white,
                            color: colorBlue,
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetLocationPage()));
                            },
                          ),
                        ],
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
