//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'CircleProgress.dart';
import 'main.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final databaseReference = FirebaseDatabase.instance.ref('test');

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;

  @override
  void initState() {
    super.initState();

    /*databaseReference
        .child('ESP32_Device')
        .once()
        .then((DatabaseEvent snapshot) {
      double temp = snapshot.value['test']['Temperature'];
      double humidity = snapshot.value['test']['Humidity'];

      isLoading = true;
      _DashboardInit(temp, humidity);
    });*/
  }

  _DashboardInit(double temp, double humid) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation =
        Tween<double>(begin: -50, end: x).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    humidityAnimation =
        Tween<double>(begin: 0, end: y).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    progressController.forward();
  }

  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Monitoring'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        ),
      body: Center(
          child: StreamBuilder(
              stream: databaseReference.onValue,
              builder: (BuildContext context,
                  AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData) {
                  Map<dynamic, dynamic> map =
                      snapshot.data.snapshot.value as dynamic;
                  List<dynamic> l = [];
                  l.clear();
                  l = map.values.toList();
                  x = l[0].toDouble();
                  y = l[1].toDouble();
                  print("$x , $y");
                } else {
                  x = 0;
                  y = 0;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomPaint(
                      foregroundPainter: CircleProgress(x.toDouble(), true),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Temperature'),
                              Text(
                                '${x}',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '°C',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomPaint(
                      foregroundPainter: CircleProgress(y.toDouble(), false),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Humidity'),
                              Text(
                                '$y',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              })),
    );
  }

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
  }
}
