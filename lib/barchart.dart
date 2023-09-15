import 'package:flutter/material.dart';

import 'package:chart/chart_data.dart';
import 'package:chart/charts/column_chart.dart';
import 'package:chart/charts/bar_with_track.dart';
import 'package:chart/charts/stacked_column.dart';
import 'package:chart/charts/column_with_track.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      body: PageView(
        children: <Widget>[
          ColumnChart(showDataPopupCallback: _showDataPopup,),
          const BarTracker(),
          const StackedColumn(),
          const ColumnTracker(),
        ],
      ),
    );
  }

  void _showDataPopup(BuildContext context, SalesData data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(data.x),
          content: Text('Value: ${data.y}'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      }
    );
  }
}

