import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/models/worldTime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  bool _hasNavigated = false;

  void setUpWorldTime(WorldTime instance) async {
    await instance.getTime();
    if (!mounted || _hasNavigated) return;

    _hasNavigated = true;
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isNightTime': instance.isNightTime,
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_hasNavigated) return; // Prevent multiple calls

    WorldTime instance = ModalRoute.of(context)!.settings.arguments as WorldTime;
    setUpWorldTime(instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWaveSpinner(
          color: Colors.blue[200]!,
          waveColor: Colors.green[200]!,
          trackColor: Colors.blue[900]!,
          size: 150.0,
        ),
      ),
    );
  }
}
