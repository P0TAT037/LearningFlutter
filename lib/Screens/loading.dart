import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hello_world/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading...";

  Future<void> setupWorldTime() async {
    late WorldTime T;
    //T = (T==Null)? WorldTime(location: "Cairo", flag: "cairo.jpg", url: "http://worldtimeapi.org/api/timezone/Africa/Cairo");

    try {
      T = ModalRoute.of(context)?.settings.arguments as WorldTime;
    }catch (e) {
      T = WorldTime(location: "Cairo", flag: "cairo.jpg", url: "http://worldtimeapi.org/api/timezone/Africa/Cairo");
    }

    await T.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': T.location,
      'flag': T.flag,
      'url': T.url,
      'time': T.time,
      'isDay': T.isDay,
    });

  }

  @override
  initState() {
    try {
      setupWorldTime();
    } catch (e) {
      // TODO
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 50,
            ),
            SizedBox(height: 10,),
            Text("Loading...", style: TextStyle(color: Colors.white, fontSize: 17),)
          ],
        )
      )

    );

  }
}
