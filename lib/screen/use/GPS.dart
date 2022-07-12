import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rescue_project_app/callapi/callapi.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/use/api/controller_history.dart';
import 'package:rescue_project_app/screen/use/final.dart';
import 'package:rescue_project_app/screen/use/pic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GPS extends StatefulWidget {
  GPS({Key? key}) : super(key: key);

  @override
  State<GPS> createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  var location = new Location();

  HistoryController historyController = Get.put(HistoryController());

  late Map<String, double> userLocation;

  var currentLocation = LatLng(0, 0);

  _userrequest(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    var data = {
      'user_id': id.toString(),
      'rqimage': 'lono',
      'rqlat': '123.0003',
      'rqlng': '123.0003',
      'rqdescription': 'ok',
    };

    var res = await CallApi().postData(data, 'userrequest');
    var respone = jsonDecode(res.body);
    historyController.onInit();
    print(respone);
    print('Response status: ${res.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlue,
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
          center: LatLng(17.974632, 102.623007),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            attributionBuilder: (_) {
              return const Text("© OpenStreetMap contributors");
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: currentLocation,
                builder: (ctx) => Container(
                  child: IconButton(
                    icon: Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45.0,
                    onPressed: () {
                      // Get.toNamed('/user-map');
                      print('x');
                    },
                  ),
                ),
              ),
            ],
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

  Future<LatLng> _getLocation() async {
    var c = LatLng;
    try {
      var current = (await location.getLocation());
      currentLocation = LatLng(current.latitude ?? 0, current.longitude ?? 0);
      setState(() {});
    } catch (e) {
      print(e);
    }
    return currentLocation;
  }
}
