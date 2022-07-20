import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rescue_project_app/callapi/callapi.dart';
import 'package:rescue_project_app/screen/use/api/controller_history.dart';
import 'package:rescue_project_app/screen/use/final.dart';
import 'package:rescue_project_app/screen/use/pic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GPS extends StatefulWidget {
  final image;
  final String descliption;
  GPS({Key? key, required this.image, this.descliption = "_"})
      : super(key: key);

  @override
  State<GPS> createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  var locationMessage = "";
  double latitude = 17.9604396;
  double longitude = 102.6057656;
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

  HistoryController historyController = Get.put(HistoryController());

  late Map<String, double> userLocation;

  var currentLocation = LatLng(0, 0);

  _userrequest(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    print(widget.descliption);
    var data = {
      'user_id': id.toString(),
      'rqimage': widget.image.toString(),
      'rqlat': latitude.toString(),
      'rqlng': longitude.toString(),
      'rqdescription': widget.descliption == "" ? "_" : widget.descliption,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Pic()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ຕຳແໜ່ງ"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(latitude, longitude),
          zoom: 9.2,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _userrequest(context);
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => Complete()));
        },
        label: Text("ຕໍ່ໄປ"),
        icon: Icon(Icons.navigate_next),
      ),
    );
  }

  // Future<LatLng> _getLocation() async {
  //   var c = LatLng;
  //   try {
  //     var current = (await location.getLocation());
  //     currentLocation = LatLng(current.latitude ?? 0, current.longitude ?? 0);
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  //   return currentLocation;
  // }
}
