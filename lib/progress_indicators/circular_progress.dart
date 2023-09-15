import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularProgressExample extends StatefulWidget {
  const CircularProgressExample({super.key});

  @override
  State<CircularProgressExample> createState() =>
      _CircularProgressExampleState();
}

class _CircularProgressExampleState extends State<CircularProgressExample> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 50.0,
      percent: 0.8,
      animation: true,
      animationDuration: 1500,
      header: Text('HEHE',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      center: Text('80%',
        style: TextStyle(
          fontSize: 30
        ),
      ),
      footer: Text('HUHU',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      progressColor: Colors.pink,
    );
  }
}
