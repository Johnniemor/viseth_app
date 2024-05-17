
import 'dart:convert';

List<Hospital> hospitalFromJson(String str) => List<Hospital>.from(json.decode(str).map((x) => Hospital.fromJson(x)));
class Hospital {
  int? id;
  String? hospitalname;

  Hospital({this.id, this.hospitalname});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalname = json['hospitalname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hospitalname'] = this.hospitalname;
    return data;
  }
}
