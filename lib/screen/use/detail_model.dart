import 'dart:convert';

List<Details> historyFromJson(String str) => List<Details>.from(json.decode(str).map((x) => Details.fromJson(x)));

class Details {
  int? id;
  String? userId;
  String? rqimage;
  String? rqlat;
  String? rqlng;
  String? rqdescription;
  String? status;
  String? comfirmedAt;
  String? rcenterName;
  String? createdAt;
  String? updatedAt;

  Details(
      {this.id,
      this.userId,
      this.rqimage,
      this.rqlat,
      this.rqlng,
      this.rqdescription,
      this.status,
      this.comfirmedAt,
      this.rcenterName,
      this.createdAt,
      this.updatedAt});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    rqimage = json['rqimage'];
    rqlat = json['rqlat'];
    rqlng = json['rqlng'];
    rqdescription = json['rqdescription'];
    status = json['status'];
    comfirmedAt = json['comfirmed_at'];
    rcenterName = json['rcenter_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['rqimage'] = this.rqimage;
    data['rqlat'] = this.rqlat;
    data['rqlng'] = this.rqlng;
    data['rqdescription'] = this.rqdescription;
    data['status'] = this.status;
    data['comfirmed_at'] = this.comfirmedAt;
    data['rcenter_name'] = this.rcenterName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
