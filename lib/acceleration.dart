import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'AccelerationCard.dart';


class AccelerationPage extends StatefulWidget {
  const AccelerationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccelerationPageState createState() => _AccelerationPageState();

}

class _AccelerationPageState extends State<AccelerationPage> {

  final List<String> _directionList = [
    "X", "Y", "Z"
  ];
  final Map<String, List> _sensorsMap = {
    "accelerometerValues": [1.0, 1.0, 1.0],
    "userAccelerometerValues": [1.0, 1.0, 1.0],
    "gyroscopeValues": [1.0, 1.0, 1.0],
    "magnetometerValues": [1.0, 1.0, 1.0]
  };
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {

    return Center(
      child: ListView(
          children: _sensorsMap.entries.map((e) {
              return ThreeDimensionView(
                valueKey: e.key,
                valueX: e.value[0],
                valueY: e.value[1],
                valueZ: e.value[2],
              );
        }).toList()
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }
  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
            (AccelerometerEvent event) {
          setState(() {
            _sensorsMap["accelerometerValues"] = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      gyroscopeEvents.listen(
            (GyroscopeEvent event) {
          setState(() {
            _sensorsMap["gyroscopeValues"] = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
            (UserAccelerometerEvent event) {
          setState(() {
            _sensorsMap["userAccelerometerValues"] = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      magnetometerEvents.listen(
            (MagnetometerEvent event) {
          setState(() {
            _sensorsMap["magnetometerValues"] = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
  }
  
}
