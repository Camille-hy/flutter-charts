import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late List<FoodData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
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
        title: Text('Pie Chart'),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 400,
              child: SfCircularChart(
                  title: ChartTitle(text: 'Food Sales'),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap),
                  tooltipBehavior: _tooltipBehavior,
                  series: _getPieSeries()),
            ),
            Container(
              width: 400,
              child: SfCircularChart(
                  title: ChartTitle(text: 'Food Sales'),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap),
                  tooltipBehavior: _tooltipBehavior,
                  series: _getRingPieSeries()),
            ),
          ],
        ),
      ),
    );
  }

  List<PieSeries<FoodData, String>> _getPieSeries() {
    return <PieSeries<FoodData, String>>[
      PieSeries<FoodData, String>(
        dataSource: _chartData,
        dataLabelMapper: (FoodData data, _) => data.text,
        xValueMapper: (FoodData data, _) => data.food,
        yValueMapper: (FoodData data, _) => data.amount,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        enableTooltip: true,
        explode: true,
        explodeIndex: 0,
        explodeOffset: '10%',
      )
    ];
  }

  List<CircularSeries<FoodData, String>> _getRingPieSeries() {
    return <CircularSeries<FoodData, String>>[
      DoughnutSeries<FoodData, String>(
        dataSource: _chartData,
        dataLabelMapper: (FoodData data, _) => data.text,
        xValueMapper: (FoodData data, _) => data.food,
        yValueMapper: (FoodData data, _) => data.amount,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        enableTooltip: true,
      )
    ];
  }

  List<FoodData> getChartData() {
    final List<FoodData> chartData = [
      FoodData('Burger', 30, 'Burger \n 30'),
      FoodData('Fries', 60, 'Fries \n 60'),
      FoodData('Apple Pie', 25, 'Apple Pie \n 25'),
      FoodData('Nugget', 35, 'Nugget \n 35'),
      FoodData('Fried Chicken', 50, 'Fried Chicken \n 50'),
      FoodData('Whipped Potato', 42, 'Whipped Potato \n 42'),
    ];
    return chartData;
  }
}

class FoodData {
  FoodData(this.food, this.amount, this.text);
  final String food;
  final int amount;
  final String text;
}
