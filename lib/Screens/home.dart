import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  late Color bgColor;
  late String bgImage;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context)?.settings.arguments as Map;
    bgColor = (data['isDay']?  Colors.blue : Colors.indigo[700])!;
    bgImage = data['isDay'] ? 'day.png' : 'night.png';
    print(data);
    return
      Scaffold(
        backgroundColor: bgColor,
        body:
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image:
                DecorationImage(
                    image: AssetImage('assets/$bgImage'),
                    fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150),
                    Text(data['time'],
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 65,
                            color: Colors.white,
                          )),
                    const SizedBox(height: 30,),
                    Text(data['location'],
                          style: const TextStyle(fontSize: 30, color: Colors.white54),),
                    const SizedBox(height: 270,),
                    TextButton(
                        onPressed: ()async {
                          Map result = await Navigator.pushNamed(context, '/location') as Map;

                            setState(()  {
                            data = {'time': result['time'], 'location': result['location']};
                                                    });
} ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.location_on_rounded, color: Colors.blueAccent,),
                            Text("Choose Location", style: TextStyle(color: Colors.white70),),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),




      )
    ;
  }
}
