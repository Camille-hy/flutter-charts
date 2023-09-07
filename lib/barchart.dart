import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late List<FoodData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  int selectedPointIndex = -1;

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
        title: Text('Bar Chart'),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      body: PageView(
        children:[ 
          Container(
            child: SfCartesianChart(
                title: ChartTitle(text: 'Food Sales'),
                tooltipBehavior: _tooltipBehavior,
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  title: AxisTitle(text: 'Food Name'),
                  labelIntersectAction: AxisLabelIntersectAction.rotate45,
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  title: AxisTitle(text: 'Sales Amount'),
                ),
                series: _getBarSeries()),
          ),
          Container(
            child: Column(
              children: [
                SfCartesianChart(
                    title: ChartTitle(text: 'Food Sales'),
                    tooltipBehavior: _tooltipBehavior,
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      title: AxisTitle(text:'Food Amount'),
                      minimum: 0,
                      maximum: 60,
                      majorTickLines: const MajorTickLines(size: 0),
                    ),
                    series: _getBarSeries2()),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Testing'),
                  )
              ],
            ),
          ),
        ], 
      ),
    );
  }

  List<ChartSeries<FoodData, String>> _getBarSeries() {
    final Map<String, Color> colorMap = {
      'Burger': Color.fromARGB(53, 92, 125, 1),
      'Fries': Color.fromARGB(192, 108, 132, 1),
      'Apple Pie': Color.fromARGB(246, 114, 128, 1),
      'Nugget': Color.fromARGB(248, 177, 149, 1),
      'Fried Chicken': Color.fromARGB(116, 180, 155, 1),
      'Whipped Potato': Color.fromARGB(255, 226, 173, 1),
    };
    return <ColumnSeries<FoodData, String>>[
      ColumnSeries<FoodData, String>(
          name: 'Food',
          dataSource: _chartData,
          xValueMapper: (FoodData data, _) => data.food,
          yValueMapper: (FoodData data, _) => data.amount,
          pointColorMapper: (FoodData data, _) => colorMap[data.food],
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
          onPointTap: (args) {
            setState(() {
              selectedPointIndex = args.pointIndex!;
              print(selectedPointIndex);
            });
            final FoodData tappedData = _chartData[selectedPointIndex];
            _showDataPopup(context, tappedData);
          })
    ];
  }

  List<ChartSeries<FoodData, String>> _getBarSeries2() {
    // final Map<String, Color> colorMap = {
    //   'Burger': Color.fromARGB(53, 92, 125, 1),
    //   'Fries': Color.fromARGB(192, 108, 132, 1),
    //   'Apple Pie': Color.fromARGB(246, 114, 128, 1),
    //   'Nugget': Color.fromARGB(248, 177, 149, 1),
    //   'Fried Chicken': Color.fromARGB(116, 180, 155, 1),
    //   'Whipped Potato': Color.fromARGB(255, 226, 173, 1),
    // };
    return <BarSeries<FoodData, String>>[
      BarSeries<FoodData, String>(
        name: 'Food',
        dataSource: _chartData,
        width: 0.6,
        xValueMapper: (FoodData data, _) => data.food,
        yValueMapper: (FoodData data, _) => data.amount,
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
        onPointTap: (args) {
          setState(() {
            selectedPointIndex = args.pointIndex!;
            print(selectedPointIndex);
          });
          final FoodData tappedData = _chartData[selectedPointIndex];
          _showDataPopup(context, tappedData);
        })
    ];
  }

  List<FoodData> getChartData() {
    final List<FoodData> chartData = [
      FoodData('Burger', 30, 'Burger \n 30'),
      FoodData('Fries', 50, 'Fries \n 60'),
      FoodData('Apple Pie', 25, 'Apple Pie \n 25'),
      FoodData('Nugget', 35, 'Nugget \n 35'),
      FoodData('Fried Chicken', 45, 'Fried Chicken \n 50'),
      FoodData('Whipped Potato', 42, 'Whipped Potato \n 42'),
    ];
    return chartData;
  }

  void _showDataPopup(BuildContext context, FoodData data) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(data.food),
            content: Text('Value: ${data.amount}'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        });
  }
}

class FoodData {
  FoodData(this.food, this.amount, this.text);
  final String food;
  final int amount;
  final String text;
}
