import 'package:flutter/material.dart';
import 'package:okr/global/service_locator.dart';
import 'package:okr/screens/landing_screen.dart';

void main() async {
  generalSetup();
  runApp(MyApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OKRs',
      home: MyHomePage(title: 'Objective Key Results'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: LandingScreen(),
    );
  }
}
