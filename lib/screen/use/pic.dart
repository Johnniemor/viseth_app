import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/showpf.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ກະລຸນາຖ່າຍຮູບຂອງທ່ານ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 30),
            ),
            const Text(
              "ເພື່ອຢືນຢັນຕົວຕົນ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //fontFamily: 'Times New Roman',
                  fontSize: 30),
            ),
            const SizedBox(
              height: 70,
            ),
            _image != null
                ? Image.file(
                    _image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/images/profilecard.png",
                    width: size.width * 3.0,
                  ),
            const SizedBox(
              height: 70,
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
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignIn3()));
              },
              child: Container(
                //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
