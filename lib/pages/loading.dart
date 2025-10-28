import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/models/worldTime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime(WorldTime instance) async{
    await instance.getTime();
    if(!mounted) return;

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isNightTime' : instance.isNightTime,
    });   //get back to choose location
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WorldTime instance = ModalRoute.of(context)!.settings.arguments as WorldTime;
    setUpWorldTime(instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitWaveSpinner(
          color: Colors.blue[200]!,
          waveColor: Colors.green[200]!,  // Color for the wave/outer ring
          trackColor: Colors.blue[900]!,  // Color for the inner track/spinner
          size: 150.0,
        ),
      ),
    );
  }
}
