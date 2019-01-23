import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Material(
        color: Colors.black,
        child: Center(
          child: Text(
            description(),
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 45.0,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }

  String description() => "hellrere";
}
