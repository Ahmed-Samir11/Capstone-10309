import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';
class ReadingsPage extends StatefulWidget {
  const ReadingsPage({super.key, required this.title});
final String title;
  @override
  State<ReadingsPage> createState() => _ReadingsPageState();
  }
class _ReadingsPageState extends State<ReadingsPage> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Temperature Real-Time Monitoring'),
      ),
    body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SfCartesianChart(
          title: ChartTitle(text: 'Temperature Readings'),
          legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<SalesData, double>(
                name: 'Temperature vs Time',
                dataSource: _chartData,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true)
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        ),
      ],
    ),);
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2010, 35),
      SalesData(2011, 28),
      SalesData(2012, 34),
      SalesData(2013, 32),
      SalesData(2014, 40)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
