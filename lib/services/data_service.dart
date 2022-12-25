import 'dart:convert';

import 'package:shifts/models/shift_model.dart';
import 'package:flutter/services.dart';
class DataService {

  Future<List<Shift>> readJsonFile() async {
    final jsonData = await rootBundle.loadString("assets/data/offered_shifts.json");
    final list = await json.decode(jsonData);
    return list['data'].map<Shift>((e) => Shift.fromJson(e)).toList();
  }
}