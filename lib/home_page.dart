import 'package:flutter/material.dart';
import 'package:flutter_application_3/Charts.dart';
import 'package:flutter_application_3/DashBoard.dart';
import 'package:flutter_application_3/maingraph.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';
import 'Charts copy.dart';
import 'maingraph.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 82, 130, 195),
        title: RichText(
          text: const TextSpan(
              text: 'Glacius Impact',
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Backgrounds/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Capstone 10309",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  height: 300,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 144, 177, 221),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6, right: 8),
                          child: Column(
                            children: [
                              Text(
                                "Imapcts of glaciers melting",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 8),
                                child: Text(
                                  "The system consists of multiple sensors that functions together to monitor the outcomes of rising in temperature degrees ",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                              Spacer(),
                              // CircleAvatar(
                              //   backgroundImage: DecorationImage(),
                              // )
                            ],
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/ios.svg",
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 36)),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const ReadingsPage(
                          title: '',
                        );
                      }),
                    );
                  },
                  child: const Text('Temperature'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const ReadingssPage(
                          title: '',
                        );
                      }),
                    );
                  },
                  child: const Text('Humidity'),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
