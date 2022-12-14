import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

class ReadingssPage extends StatefulWidget {
  const ReadingssPage({super.key, required this.title});
  final String title;
  @override
  State<ReadingssPage> createState() => _ReadingssPageState();
}

class _ReadingssPageState extends State<ReadingssPage> {
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
        title: const Text('Humidity Real-Time Monitoring'),
      ),
      body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SfCartesianChart(
          title: ChartTitle(text: 'Humidity Readings'),
          legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<SalesData, double>(
                name: 'Humidity vs Time',
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
    ),
        );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2010, 35),
      SalesData(2011, 28),
      SalesData(2012, 34),
      SalesData(2013, 32),
      SalesData(2014, 40),
      SalesData(2015, 50),
      SalesData(2016, 20),
      SalesData(2017, 44),
      SalesData(2018, 22),
      SalesData(2019, 16),
      SalesData(2020, 89),
      SalesData(2021, 69),
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
