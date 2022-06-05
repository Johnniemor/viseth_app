import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rescue_project_app/constant/api.dart';
import 'package:rescue_project_app/constant/constant.dart';
import 'package:rescue_project_app/screen/stuff/detail.dart';

import 'package:rescue_project_app/screen/stuff/picR.dart';

class GetLocationPage extends StatefulWidget {
  GetLocationPage({Key? key}) : super(key: key);

  @override
  State<GetLocationPage> createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  var location = new Location();

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
                context, MaterialPageRoute(builder: (context) => PicR()));
            print("Back");
          }),
        ),
        elevation: 5,
        title: const Text("ແຈ້ງອຸບັດຕິເຫດ"),
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
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Detail()));
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
