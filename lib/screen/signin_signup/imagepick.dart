import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
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
  XFile? _image;
  ImagePicker? picker = ImagePicker();
  Future getimage() async {
    final XFile? pickedFile = await picker!.pickImage(
      source: ImageSource.camera,
      maxWidth: 2000,
      maxHeight: 2000,
    );
    setState(() {
      _image = pickedFile!;
    });

    profileUser();
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      // setState(() {
      //   _image = imagePermanent!;
      // });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  UploadTask? uploadTask;
  late String urlImag1;

  Future profileUser() async {
    final path = 'profile/BundoStore-${_image!.name}';
    final file = File(_image!.path);

    final ref = FirebaseStorage.instance.ref().child(path);

    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlImage = await snapshot.ref.getDownloadURL();
    setState(() {
      urlImag1 = urlImage;
    });
    //_updateDataImage();
    print('Linkkkkkkkkkkk: ' + urlImage);
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
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 60),
                  const Center(
                    child: Text(
                      "ກະລຸນາຖ່າຍຮູບຂອງທ່ານ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          //fontFamily: 'Times New Roman',
                          fontSize: 30),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "ເພື່ອຢືນຢັນຕົວຕົນ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          //fontFamily: 'Times New Roman',
                          fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _image != null
                      ? Image.file(
                          File(_image!.path),
                          width: 350,
                          height: 350,
                        )
                      : Image.asset(
                          "assets/images/profilecard.png",
                          width: size.width * 3.0,
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: 115.0,
                        height: 70.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(colorRed),
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 50,
                          ),
                          //icon: Icon(Icons.add),
                          //label: const Text("ສະໝັກສະມາຊິກ",
                          //    style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            getimage();
                          },
                        ),
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
