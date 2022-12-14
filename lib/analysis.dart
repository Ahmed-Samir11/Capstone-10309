import 'package:flutter/material.dart';
import 'package:flutter_application_3/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';
class Analysis extends StatelessWidget {
  const Analysis({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Analysis',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          canvasColor: Colors.grey.shade200,
          platform: TargetPlatform.iOS),
    );
  }
}
class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key, required this.title});
  final String title;
  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}
class _AnalysisPageState extends State<AnalysisPage>{
@override
  Widget build(BuildContext context){
    return Scaffold(
      body: RichText(
          text: const TextSpan(
              text: 'Flutter is UI framework developed by Google for building reactive websites, desktop, iOS and Android applications. Flutter is essentially dependent on Dart, a modern object-oriented language which compiles already-prepared JavaScript code. In addition, Flutter uses its own engine to render “widgets”.  Widgets are similar to the definition of layers; in Adobe Photoshop or Illustrator, an image is built and modified by adding, editing, and remodeling layers. Similarly, widgets are the building units of Flutter, configurations that creates the user interface. Flutter mainly depends on two types of widgets: "StatefulWidget" and "StatelessWidget". "StatefulWidget" is used in situations in which the values or states change, and "StatelessWidget" is used in contrast, situations in which values do not change arbitrarily.',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              )),
        ),
    );
  }
}