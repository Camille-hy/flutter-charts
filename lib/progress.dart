import 'package:flutter/material.dart';
import 'package:chart/progress_indicators/circular_progress.dart';
import 'package:chart/progress_indicators/linear_progress.dart';

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
        centerTitle: true,
      ),
      body: PageView(
        children: <Widget>[
          CircularProgressExample(),
          LinearProgressExample(),
        ],
      ),
    );
  }
}
