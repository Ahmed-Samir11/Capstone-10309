//@dart = 2.9
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

class mainGraph extends StatefulWidget {
  const mainGraph({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _mainGraphState createState() => _mainGraphState();
}

class _mainGraphState extends State<mainGraph> {
  List<LiveData> chartData;
  ChartSeriesController _chartSeriesController;
  final referenceDatase = FirebaseDatabase.instance.ref('test');

  double x;
  double y;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 3), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: referenceDatase.onValue,
            builder:
                (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (snapshot.hasData) {
                Map<dynamic, dynamic> map =
                    snapshot.data.snapshot.value as dynamic;
                List<dynamic> l = [];
                l.clear();
                l = map.values.toList();
                x = l[0].toDouble();
                y = l[1].toDouble();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    SfCartesianChart(
                        series: <LineSeries<LiveData, int>>[
                          LineSeries<LiveData, int>(
                            onRendererCreated:
                                (ChartSeriesController controller) {
                              _chartSeriesController = controller;
                            },
                            dataSource: chartData,
                            color: const Color.fromRGBO(192, 108, 132, 1),
                            xValueMapper: (LiveData sales, _) =>
                                sales.time.toInt(),
                            yValueMapper: (LiveData sales, _) => sales.speed,
                          )
                        ],
                        primaryXAxis: NumericAxis(
                            majorGridLines: const MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            interval: 3,
                            title: AxisTitle(text: 'Time (seconds)')),
                        primaryYAxis: NumericAxis(
                            axisLine: const AxisLine(width: 0),
                            majorTickLines: const MajorTickLines(size: 0),
                            title: AxisTitle(text: 'Internet speed (Mbps)'))),
                    SfCartesianChart(
                        series: <LineSeries<LiveData, int>>[
                          LineSeries<LiveData, int>(
                            onRendererCreated:
                                (ChartSeriesController controller) {
                              _chartSeriesController = controller;
                            },
                            dataSource: chartData,
                            color: const Color.fromRGBO(192, 108, 132, 1),
                            xValueMapper: (LiveData sales, _) =>
                                sales.time.toInt(),
                            yValueMapper: (LiveData sales, _) => sales.speed,
                          )
                        ],
                        primaryXAxis: NumericAxis(
                            majorGridLines: const MajorGridLines(width: 0),
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            interval: 3,
                            title: AxisTitle(text: 'Time (seconds)')),
                        primaryYAxis: NumericAxis(
                            axisLine: const AxisLine(width: 0),
                            majorTickLines: const MajorTickLines(size: 0),
                            title: AxisTitle(text: 'Internet speed (Mbps)'))),
                  ],
                );
              } else {
                return Center(child: Text('No data'));
              }
            }));
  }

  int time = 19;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(x, y));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94)
    ];
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final double time;
  final double speed;
}
