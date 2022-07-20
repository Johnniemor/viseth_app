import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:latlong2/latlong.dart';
import 'package:rescue_project_app/screen/use/api/controller_history.dart';
import 'package:rescue_project_app/screen/use/final.dart';
import 'package:rescue_project_app/screen/use/use.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../callapi/callapi.dart';

class Pic extends StatefulWidget {
  const Pic({Key? key}) : super(key: key);

  @override
  _PicAppState createState() => _PicAppState();
}

class _PicAppState extends State<Pic> {
  TextEditingController controller = TextEditingController();
  XFile? _image;
  HistoryController historyController = Get.put(HistoryController());
  var locationMessage = "";
  double latitude = 0;
  double longitude = 0;
  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    Position? lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "${position.latitude},${position.longitude}";
      latitude = position.latitude;
      longitude = position.longitude;
      print(locationMessage);
    });
  }

  late Map<String, double> userLocation;

  var currentLocation = LatLng(0, 0);

  _userrequest(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    print(controller.text);
    var data = {
      'user_id': id.toString(),
      'rqimage': urlImag1,
      'rqlat': latitude.toString(),
      'rqlng': longitude.toString(),
      'rqdescription': controller.text == "" ? "_" : controller.text,
    };
    print(data);

    var res = await CallApi().postData(data, 'userrequest');
    var respone = jsonDecode(res.body);
    historyController.onInit();
    print(respone);
    print('Response status: ${res.statusCode}');
    if (res.statusCode == 200) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (Ali) => Complete()));
    }
  }

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

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
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
                context, MaterialPageRoute(builder: (context) => Use()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ແຈ້ງອຸບັດຕິເຫດ"),
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
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _image != null
                      ? Image.file(
                          File(_image!.path),
                          width: 350,
                          height: 350,
                        )
                      : Image.asset(
                          "assets/images/accident.png",
                          width: size.width * 3.0,
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: colorBlue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ລາຍລະອຽດເພີມເຕີມ',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  MaterialButton(
                    onPressed: () {
                      getimage();
                    },
                    color: colorRed,
                    textColor: Colors.white,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 50,
                    ),
                    padding: EdgeInsets.all(25),
                    shape: CircleBorder(),
                  ),
                  InkWell(
                    child: Center(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        buttonPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        buttonHeight: 50,
                        buttonMinWidth: 150,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: colorBlue, width: 2),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              "ຍົກເລີກ",
                              style: TextStyle(fontSize: 25),
                            ),
                            textColor: colorBlue,
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: colorBlue, width: 2),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              "ຕໍ່ໄປ",
                              style: TextStyle(fontSize: 25),
                            ),
                            textColor: Colors.white,
                            color: colorBlue,
                            onPressed: () {
                              _userrequest(context);
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
