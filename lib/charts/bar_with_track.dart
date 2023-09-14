import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../chart_data.dart';

class BarTracker extends StatelessWidget {
  const BarTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(width: 0),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              isVisible: false,
              majorGridLines: const MajorGridLines(width: 0),
              title: AxisTitle(text: 'Food Amount'),
              minimum: 0,
              maximum: 60,
              majorTickLines: const MajorTickLines(size: 0),
            ),
            series: getBarSeries2()
          ),
          ElevatedButton(
            onPressed: (){}, 
            child: const Text('Testing')
          )
        ],
      ),
    );
  }

  List<ChartSeries<SalesData, String>> getBarSeries2() {
    final List<SalesData> salesData = getSalesData();
    // final Map<String, Color> colorMap = {
    //   'Burger': Color.fromARGB(53, 92, 125, 1),
    //   'Fries': Color.fromARGB(192, 108, 132, 1),
    //   'Apple Pie': Color.fromARGB(246, 114, 128, 1),
    //   'Nugget': Color.fromARGB(248, 177, 149, 1),
    //   'Fried Chicken': Color.fromARGB(116, 180, 155, 1),
    //   'Whipped Potato': Color.fromARGB(255, 226, 173, 1),
    // };
    return <BarSeries<SalesData, String>>[
      BarSeries<SalesData, String>(
        name: 'Sales',
        dataSource: salesData,
        width: 0.6,
        xValueMapper: (SalesData sales, _) => sales.x as String,
        yValueMapper: (SalesData sales, _) => sales.y,
        // pointColorMapper: (FoodData data, _) => colorMap[data.food],
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(53, 92, 125, 1),
            Color.fromRGBO(192, 108, 132, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
        trackColor: const Color.fromRGBO(220, 220, 220, 1),
        isTrackVisible: true,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
          alignment: ChartAlignment.near,
          textStyle: TextStyle(
            fontSize: 12,
          ),
        ),
      )
    ];
  }
}