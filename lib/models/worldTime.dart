import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime{
    String location;
    String time = "";
    String flag;
    String url;
    bool isNightTime = false;

    WorldTime({required this.location, required this.flag, required this.url});



    Future<void> getTime() async {

        try {
            http.Response response = await http.get(
                Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=${this.url}'));
            DateTime now = DateTime.parse(jsonDecode(response.body)['dateTime']);
            isNightTime = now.hour > 18 || now.hour < 6 ? true : false;
            print(isNightTime);
            print(now.hour);
            time = DateFormat.jm().format(now);
        }catch(e){
            print('error : $e');
        }

    }


}