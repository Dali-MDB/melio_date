import 'package:flutter/material.dart';
import 'package:test_app/pages/choose_location.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/pages/loading.dart';

void main() => runApp(
  MaterialApp(
    title: 'weather app',
    initialRoute: '/',
    routes: {
      '/':(context)=>Home(),
      'loading/':(context)=>Loading(),
      'choose_location/': (context)=>ChooseLocation(),
    },
  ),
);
