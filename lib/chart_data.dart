class SalesData {
  SalesData(this.x, this.y, this.secondY);

  final dynamic x;
  final num y;
  final num secondY;
}

List<SalesData> getSalesData() {
  final List<SalesData> chartData = [
    SalesData('AL', 40, 10),
    SalesData('MC', 10, 5),
    SalesData('UL', 60, 25),
    SalesData('SL', 30, 30),
    SalesData('ML', 20, 0),
  ];
  return chartData;
}
