import 'dart:core';

import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String country = "algeria";
  String time = "21:23";
  String flag = "url";
  Color bg = Colors.blue[200]! ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('World Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('world time'),
                Text(country),
                Text(time),
              ],

            ),
            ElevatedButton(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, 'choose_location/');
                  setState(() {
                    country = result['location'];
                    time = result['time'];
                    flag = result['flag'];
                    bg =  result['isNightTime'] ? Colors.blue[800]! : Colors.blue[200]!;

                  });
                },
                child: Text('choose location')
            )

          ],
        ),
      )
    );
  }
}
