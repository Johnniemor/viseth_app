import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/stuff/detail.dart';
import 'package:rescue_project_app/screen/stuff/picR.dart';
import 'package:rescue_project_app/screen/stuff/staff.dart';

class GetLocationPage extends StatefulWidget {
  GetLocationPage({Key? key}) : super(key: key);

  @override
  State<GetLocationPage> createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  var location = new Location();
  double latitude = 17.9604396;
  double longitude = 102.6057656;

  late Map<String, double> userLocation;

  var currentLocation = LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Staff()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ຕໍາແໜ່ງການແຈ້ງອຸບັດຕິເຫດ"),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(latitude, longitude),
          zoom: 13,
        ),
        children: [ ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => Detail()));
      //   },
      //   label: Text("ຕໍ່ໄປ"),
      //   icon: Icon(Icons.navigate_next),
      // ),
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
