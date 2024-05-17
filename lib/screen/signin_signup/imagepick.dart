import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rescue_project_app/callapi/callapi.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/signin_signup/signup.dart';
import 'package:rescue_project_app/screen/signin_signup/wait.dart';

class Userconfirm extends StatefulWidget {
  final String name;
  final String surname;
  final String gender;
  final String birth;
  final String tel;
  final String village;
  final String district;
  final String province;
  final String password;

  const Userconfirm(
      {Key? key,
      required this.name,
      required this.surname,
      required this.birth,
      required this.district,
      required this.gender,
      required this.password,
      required this.province,
      required this.tel,
      required this.village})
      : super(key: key);

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
      maxHeight: 1497,
    );
    setState(() {
      _image = pickedFile!;
    });

    profileUser();
  }

  _register(BuildContext context) async {
    var data = {
      'name': widget.name,
      'surname': widget.surname,
      'birth': widget.birth,
      'gender': widget.gender,
      'tel': widget.tel,
      'village': widget.village,
      'district': widget.district,
      'province': widget.province,
      'password': widget.password,
      'password_confirmation': widget.password,
      'userimage': urlImag1.toString()
    };

    var res = await CallApi().postData(
      data,
      'register',
    );
    print(data);
    print('Response status: ${res.statusCode}');
    if (res.statusCode == 200) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (Ali) => Wait()));
    }
    ;
    var body = json.decode(res.body);
    print(body);
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
  late String urlImag1 = '';

  Future profileUser() async {
    final path = 'profile/rescue-${_image!.name}';
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
        title: const Text("ຖ່າຍຮູບ"),
        centerTitle: true,
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
                  SizedBox(height: 30),
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
                      "ພ້ອມກັບບັດປະຈໍາ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          //fontFamily: 'Times New Roman',
                          fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _image != null
                      ? Image.file(
                          File(_image!.path),
                          width: 350,
                          height: 350,
                        )
                      : Image.asset(
                          "assets/images/amiw.png",
                          width: size.width * 0.5,
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
                  urlImag1.toString() == ''
                      ? Container()
                      : InkWell(
                          onTap: () {
                            _register(context);
                          },
                          child: Container(
                            //ປຸ່ມ "ຕໍ່ໄປໜ້າໃໝ່"
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            decoration: const BoxDecoration(
                                color: colorRed,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "ຢືນຢັນ",
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
