import 'package:flutter/material.dart';
import 'package:test_app/models/worldTime.dart';

class ChooseLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     List<WorldTime> countries = [
       WorldTime(location: 'Algeria', flag: 'Algeria.png', url: 'Africa/Algiers'),
       WorldTime(location: 'France', flag: 'France.png', url: 'Europe/Paris'),
       WorldTime(location: 'Germany', flag: 'Germany.png', url: 'Europe/Berlin'),
       WorldTime(location: 'United Kingdom', flag: 'United Kingdom.png', url: 'Europe/London'),
       WorldTime(location: 'Spain', flag: 'Spain.png', url: 'Europe/Madrid'),
       WorldTime(location: 'Italy', flag: 'Italy.png', url: 'Europe/Rome'),
       WorldTime(location: 'Egypt', flag: 'Egypt.png', url: 'Africa/Cairo'),
       WorldTime(location: 'Japan', flag: 'Japan.png', url: 'Asia/Tokyo'),
       WorldTime(location: 'China', flag: 'China.png', url: 'Asia/Shanghai'),
       WorldTime(location: 'India', flag: 'India.png', url: 'Asia/Kolkata'),
       WorldTime(location: 'United States', flag: 'United States.png', url: 'America/New_York'),
       WorldTime(location: 'Canada', flag: 'Canada.png', url: 'America/Toronto'),
       WorldTime(location: 'Brazil', flag: 'Brazil.png', url: 'America/Sao_Paulo'),
       WorldTime(location: 'Australia', flag: 'Australia.png', url: 'Australia/Sydney'),
       WorldTime(location: 'Russia', flag: 'Russia.png', url: 'Europe/Moscow'),
       WorldTime(location: 'Turkey', flag: 'Turkey.png', url: 'Europe/Istanbul'),
       WorldTime(location: 'South Africa', flag: 'South Africa.png', url: 'Africa/Johannesburg'),
       WorldTime(location: 'Argentina', flag: 'Argentina.png', url: 'America/Argentina/Buenos_Aires'),
       WorldTime(location: 'Mexico', flag: 'Mexico.png', url: 'America/Mexico_City'),
       WorldTime(location: 'Indonesia', flag: 'Indonesia.png', url: 'Asia/Jakarta'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text('choose location'),
      ),
      body: ListView(
        children:
          countries.map((element) => Card(
            child: ListTile(
              onTap: () async {
                print(element.location);
                dynamic result = await Navigator.pushNamed(
                  context,
                  'loading/',
                  arguments: element,
                );
                Navigator.pop(context,{
                    'location': result['location'],
                    'flag': result['flag'],
                    'time': result['time'],
                    'isNightTime' : result['isNightTime'],
                  });
                // await element.getTime();
                // if (!context.mounted) return;
                // Navigator.pop(context,{
                //   'location': element.location,
                //   'flag': element.flag,
                //   'time': element.time,
                // });
              },
              title: Padding(
                padding: EdgeInsets.fromLTRB(12, 8, 0, 8),
                child: Text(element.location),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/flags/${element.flag}'),
              ),
            ),
          )).toList()

        ,
      ),
    );
  }
}
