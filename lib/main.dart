//@dart=2.9
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/DashBoard.dart';
import 'package:flutter_application_3/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';
import 'analysis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'onboding_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({key});
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: OnbodingScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}
class Mother extends StatefulWidget {
  const Mother({key, this.title});
  final String title;
  @override
  State<Mother> createState() => _MotherState();
}
class _MotherState extends State<Mother> {
int _currentIndex = 0;
onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
}
// End My new Code
Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return Dashboard();
        break;
      case 2:
        return Dashboard();
        break;
    }
  }

  String title(int index) {
    String address;
    setState(() {
      switch (index) {
        case 0:
          return address = "Home Page";
          break;
        case 1:
          return address = "Analysis";
          break;
          case 2:
          return address = "Dashboard";
          break;
        default:
          return address = "Home Page";
          break;
      }
    });
    return address;
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color.fromARGB(255, 144, 177, 221) ,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 9, 0, 109), // Navigation bar
          statusBarColor: Color.fromARGB(156, 0, 34, 60), // Status bar
        ),
        title: Text(title(_currentIndex)),
      ),
      
      body: 
      getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 82, 130, 195),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            backgroundColor: Colors.blue,
            label: 'Real-Time',
          ),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue.shade900,
        showUnselectedLabels: true,
        onTap: onTabTapped,
      ),
    );
  }
}