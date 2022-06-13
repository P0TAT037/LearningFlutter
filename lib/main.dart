import 'package:flutter/material.dart';
import 'package:hello_world/Screens/home.dart';
import 'package:hello_world/Screens/choose_location.dart';
import 'package:hello_world/Screens/loading.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: '/',
        routes:
        {
          '/':(context)=>const Loading(),
          '/home': (context)=>const Home(),
          '/location': (context)=>const ChooseLocation(),
        },
      )
  );
}





