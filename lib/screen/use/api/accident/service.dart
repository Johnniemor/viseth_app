import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rescue_project_app/screen/use/api/accident/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteServiceHospital{
  static var client = http.Client();

  static Future<List<Hospital>?> fetchCategories() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString('id');
    var response = await client
        .get(Uri.parse('http://10.0.2.2:8000/api/hospital'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print(jsonString);
      return hospitalFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }
}