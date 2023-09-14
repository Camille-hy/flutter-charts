import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../chart_data.dart';

class ColumnTracker extends StatelessWidget {
  const ColumnTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 100,
        axisLine: const AxisLine(width: 0),
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: getColumnTracker(),
    );
  }

  List<ColumnSeries<SalesData, String>> getColumnTracker() {
    final List<SalesData> salesData = getSalesData();
    final Map<String, Color> colorMap = {
      'AL': Color.fromRGBO(51, 219, 149, 1),
      'MC': Color.fromRGBO(79, 178, 134, 1),
      'UL': Color.fromRGBO(60, 137, 109, 1),
      'SL': Color.fromRGBO(84, 109, 100, 1),
      'ML': Color.fromRGBO(116, 180, 155, 1),
    };
    return <ColumnSeries<SalesData, String>>[
      ColumnSeries<SalesData, String>(
        dataSource: salesData,
        xValueMapper: (SalesData sales, _) => sales.x as String,
        yValueMapper: (SalesData sales, _) => sales.y,
        isTrackVisible: true,
        trackColor: Color.fromARGB(255, 217, 220, 224),
        pointColorMapper: (SalesData data, _) => colorMap[data.x],
      )
    ];
  }
}
