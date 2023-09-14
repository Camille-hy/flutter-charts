import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../chart_data.dart';

class StackedColumn extends StatelessWidget {
  const StackedColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: Legend(overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
        axisLine: AxisLine(width: 0),
        maximum: 130,
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: _getStackedColumnSeries(),  
    );
  
  }
  List<StackedColumnSeries<SalesData, String>> _getStackedColumnSeries() {
    final List<SalesData> salesData = getSalesData();
    return <StackedColumnSeries<SalesData, String>>[
      StackedColumnSeries<SalesData, String>(
        dataSource: salesData,
        xValueMapper: (SalesData sales, _) => sales.x as String,
        yValueMapper: (SalesData sales, _) => sales.y,
        color: Colors.orangeAccent,
      ),
      StackedColumnSeries(
        dataSource: salesData,
        xValueMapper: (SalesData sales, _) => sales.x as String,
        yValueMapper: (SalesData sales, _) => sales.y,
        color: Colors.amberAccent,
      ),
    ];
  }
}