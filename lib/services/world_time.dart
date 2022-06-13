import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime{
  late String location;
  late Uri url;
  late String flag;
  late String time;
  late bool isDay;

  WorldTime({this.location = "", this.flag = "", String url = "http://worldtimeapi.org/api/timezone/Africa/Cairo"}){
    this.url = Uri.parse(url);
  }

  Future<String> getTime() async {
    try{
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      int offset_h = int.parse(data['utc_offset'].substring(1,3));
      int offset_m = int.parse(data['utc_offset'].substring(4));
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: offset_h, minutes: offset_m));
      isDay = (now.hour >= 6)&&(now.hour <= 18);
      time = DateFormat.jm().format(now);

    }catch(e) {
      print('could not get the time : $e');
      time = 'couldn\'t load the time';
    }
    return time;
  }
}
