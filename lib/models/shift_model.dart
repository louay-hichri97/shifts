import 'package:shifts/models/recurring_model.dart';

class Shift {
  int? id;
  String? status;
  String? startAt;
  String? endAt;
  String? postName;
  int? postId;
  bool? startSoon;
  Recurring? recurring;
  String? company;
  String? buyPrice;
  int? bonus;
  double? latitude;
  double? longitude;

  Shift(
      {this.id,
      this.status,
      this.startAt,
      this.endAt,
      this.postName,
      this.postId,
      this.startSoon,
      this.recurring,
      this.company,
      this.buyPrice,
      this.bonus,
      this.latitude,
      this.longitude});

  Shift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    postName = json['post_name'];
    postId = json['post_id'];
    startSoon = json['start_soon'];
    //recurring = null;
    if(json["recurring"] != null) {
      recurring = Recurring.fromJson(json["recurring"]);
    } else {
      recurring = null;
    }



    company = json['company'];
    buyPrice = json['buy_price'];
    bonus = json['bonus'];
    latitude = json['latitude'];
    longitude = json['longitude'];

  }
}