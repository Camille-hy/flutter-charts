import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../chart_data.dart';

typedef ShowDataPopupCallback = void Function(
    BuildContext context, SalesData data);

class ColumnChart extends StatefulWidget {
  final ShowDataPopupCallback showDataPopupCallback;

  const ColumnChart({Key? key, required this.showDataPopupCallback})
      : super(key: key);

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  int yMaximum = 0;
  int selectedPointIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<SalesData> salesData = getSalesData();
    getMax(salesData);

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

  void getMax(List<SalesData> data) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].y > yMaximum) {
        yMaximum = data[i].y;
      }
    }
  }

  List<ChartSeries<SalesData, String>> _getBarSeries() {
    // final Map<String, Color> colorMap = {
    //   'AL': const Color.fromARGB(53, 92, 125, 1),
    //   'MC': const Color.fromARGB(192, 108, 132, 1),
    //   'UL': const Color.fromARGB(246, 114, 128, 1),
    //   'SL': const Color.fromARGB(248, 177, 149, 1),
    //   'ML': const Color.fromARGB(116, 180, 155, 1),
    // };
    final List<SalesData> salesData = getSalesData();
    return <ColumnSeries<SalesData, String>>[
      ColumnSeries<SalesData, String>(
          name: 'Food',
          dataSource: salesData,
          xValueMapper: (SalesData data, _) => data.x,
          yValueMapper: (SalesData data, _) => data.y,
          // pointColorMapper: (SalesData data, _) => colorMap[data.x],
          pointColorMapper: (SalesData data, _) => data.y == yMaximum
              ? Color.fromARGB(255, 29, 235, 90)
              : Color.fromARGB(255, 238, 9, 58),
          onPointTap: (args) {
            setState(() {
              selectedPointIndex = args.pointIndex!;
              print(selectedPointIndex);
            });
            final SalesData tappedData = salesData[selectedPointIndex];
            widget.showDataPopupCallback(context, tappedData);
          })
    ];
  }
}
