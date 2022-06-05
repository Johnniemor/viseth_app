import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rescue_project_app/constant/api.dart';

class UserService {
  Future<bool> login(String username, String password) async {
    try {
      var url = Uri.parse(API_URL + '/auth/local/login');

      var response = await http.post(
        url,
        body: jsonEncode({'username': username, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        log(response.body);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      log(e.toString());
      return false;
    }
  }
}
