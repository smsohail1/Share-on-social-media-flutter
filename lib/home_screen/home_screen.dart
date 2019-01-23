import 'package:flutter/material.dart';
import 'package:color/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "flutter app",
        home: Scaffold(
            appBar: AppBar(title: Text('Test')),
            body: Material(
                color: Colors.amber,
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(6.0),
                  color: Colors.deepOrange,
                  width: 300.0,
                  child: Text(
                    description(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 42.0,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                ))));
  }

  String description() {
    int i = 67;
    var jjj="78s";
    var k=22;

    return "hellre ${i},,${jjj},,,${k}";
  }
}
