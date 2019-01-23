import 'package:flutter/material.dart';
import './home_screen/home_screen.dart';
import './splash/splash.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(body: HomeScreen()));
  }
}
