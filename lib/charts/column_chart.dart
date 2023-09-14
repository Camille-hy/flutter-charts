import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../chart_data.dart';

typedef ShowDataPopupCallback = void Function(BuildContext context, SalesData data);

class ColumnChart extends StatefulWidget {
  final ShowDataPopupCallback showDataPopupCallback;

  const ColumnChart({Key? key, required this.showDataPopupCallback}) : super(key: key);

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  int selectedPointIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(text: 'Sales'),
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text: 'Food Name'),
          labelIntersectAction: AxisLabelIntersectAction.rotate45,
        ),
        primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text: 'Sales Amount'),
        ),
        series: _getBarSeries());
  }

  List<ChartSeries<SalesData, String>> _getBarSeries() {
    final Map<String, Color> colorMap = {
      'AL': Color.fromARGB(53, 92, 125, 1),
      'MC': Color.fromARGB(192, 108, 132, 1),
      'UL': Color.fromARGB(246, 114, 128, 1),
      'SL': Color.fromARGB(248, 177, 149, 1),
      'ML': Color.fromARGB(116, 180, 155, 1),
    };
    final List<SalesData> salesData = getSalesData();
    return <ColumnSeries<SalesData, String>>[
      ColumnSeries<SalesData, String>(
        name: 'Food',
        dataSource: salesData,
        xValueMapper: (SalesData data, _) => data.x,
        yValueMapper: (SalesData data, _) => data.y,
        pointColorMapper: (SalesData data, _) => colorMap[data.x],
        onPointTap: (args) {
          setState(() {
            selectedPointIndex = args.pointIndex!;
            print(selectedPointIndex);
          });
          final SalesData tappedData = salesData[selectedPointIndex];
          widget.showDataPopupCallback(context, tappedData);
        }
      )
    ];
  }
}
