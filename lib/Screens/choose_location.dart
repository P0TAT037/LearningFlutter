import 'package:flutter/material.dart';
import 'package:hello_world/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'http://worldtimeapi.org/api/timezone/Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () async{
                await locations[index].getTime();
                Navigator.pop(context, {
                  'location': locations[index].location,
                  'flag': locations[index].flag,
                  'url': locations[index].url,
                  'time': locations[index].time,
                  'isDay': locations[index].isDay,
                });
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),)
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text("Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
    );
  }
}
