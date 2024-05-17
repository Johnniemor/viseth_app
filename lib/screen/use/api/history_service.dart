import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rescue_project_app/screen/use/api/history_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteServiceHistory{
  static var client = http.Client();

  static Future<List<History>?> fetchCategories() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString('id');
    var response = await client
        .get(Uri.parse('http://10.0.2.2:8000/api/showhistory/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print(jsonString);
      return historyFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }
}