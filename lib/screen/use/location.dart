import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rescue_project_app/constant/api.dart';
import 'package:rescue_project_app/constant/constant.dart';

class UserLocation extends StatefulWidget {
  UserLocation({Key? key}) : super(key: key);

  @override
  State<UserLocation> createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  var centerList = [];
  loadData() async {
    String gql = '''
query{
  rescue_center{
    id
    name
    location
  }
}''';
    try {
      var req = await api.query(gql);
      print(req);
      var data = req['data']['rescue_center'];
      for (var i = 0; i < data.length; i++) {
        var x = data[i];
        var point = x['location'].toString().split(',');
        centerList.add(LatLng(double.parse(point[0]), double.parse(point[1])));
      }

      setState(() {
        centerList = centerList;
      });
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loadData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 5,
        title: const Text("ແຈ້ງອຸບັດຕິເຫດ"),
        centerTitle: true,
      ),
      backgroundColor: colorBlue,
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 180),
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(17.9605903, 102.5357251),
            zoom: 13,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                ...centerList.map((e) =>
                    Marker(point: e, builder: (ctx) => Icon(Icons.location_on)))
                // new Marker(
                //   width: 80.0,
                //   height: 80.0,
                //   point: new LatLng(17.987069, 102.635259),
                //   builder: (ctx) => new Container(
                //     child: Icon(
                //       Icons.location_on,
                //       size: 50,
                //       color: colorRed,
                //     ),
                //   ),
                // ),
                // new Marker(
                //   width: 80.0,
                //   height: 80.0,
                //   point: new LatLng(17.977736, 102.557354),
                //   builder: (ctx) => new Container(
                //     child: Icon(
                //       Icons.location_on,
                //       size: 50,
                //       color: colorRed,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
