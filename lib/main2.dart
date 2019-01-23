import 'dart:io';
import 'package:flutter/material.dart';
import 'package:advanced_share/advanced_share.dart' show AdvancedShare;
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  //_MyAppState createState() => new _MyAppState();

  _MyAppShare createState() => new _MyAppShare();
}

class _MyAppShare extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Advanced Share',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Advanced Share example app'),
        ),
        body: new Column(
          children: <Widget>[
            RaisedButton(
              child: Text('share to twitter'),
              onPressed: () async {
                var response = await FlutterShareMe().shareToTwitter(
                    url: 'https://github.com/lizhuoyuan',
                    msg: 'hello flutter! ');
                if (response == 'success') {
                  print('navigate success');
                }
              },
            ),
            RaisedButton(
              child: Text('share to shareWhatsApp'),
              onPressed: () {
                FlutterShareMe().shareToWhatsApp(
                    msg:
                        'hello,this is my github:https://github.com/lizhuoyuan');
              },
            ),
            RaisedButton(
              child: Text('share to shareFacebook'),
              onPressed: () {
                FlutterShareMe().shareToFacebook(
                    url: 'https://github.com/lizhuoyuan', msg: 'Hello Flutter');
              },
            ),
            RaisedButton(
              child: Text('share to System'),
              onPressed: () async {
                var response =
                    await FlutterShareMe().shareToSystem(msg: 'Hello Flutter');
                if (response == 'success') {
                  print('navigate success');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
  }

  void handleResponse(response, {String appName}) {
    if (response == 0) {
      print("failed.");
    } else if (response == 1) {
      print("success");
    } else if (response == 2) {
      print("application isn't installed");
      if (appName != null) {
        scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("${appName} isn't installed."),
          duration: new Duration(seconds: 4),
        ));
      }
    }
  }

  void generic() {
    AdvancedShare.generic(msg: "Hello", url: BASE64_IMAGE).then((response) {
      handleResponse(response);
    });
  }

  void whatsapp() {
    AdvancedShare.whatsapp(msg: "It's okay :)", url: BASE64_IMAGE)
        .then((response) {
      handleResponse(response, appName: "Whatsapp");
    });
  }

  void gmail() {
    AdvancedShare.gmail(
            subject: "Advanced Share", msg: "Mail body", url: BASE64_IMAGE)
        .then((response) {
      handleResponse(response, appName: "Gmail");
    });
  }

  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Advanced Share',
      home: new Scaffold(
          key: scaffoldKey,
          appBar: new AppBar(
            title: new Text('Advanced Share example app'),
          ),
          body: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text("Generic Share"),
                onTap: generic,
              ),
              new ListTile(
                title: new Text("Whatsapp Share"),
                onTap: whatsapp,
              ),
              new ListTile(
                title: new Text("Gmail Share"),
                onTap: gmail,
              ),
              new ListTile(
                title: new Text("Redirect to browse"),
                onTap: _launchURL,
              ),
              new ListTile(
                title: new Container(
                    width: 30.0,
                    height: 100.0,
                    child: new RaisedButton(
                      onPressed: subtractNumbers,
                      textColor: Colors.white,
                      color: Colors.red,
                      padding: const EdgeInsets.all(8.0),
                      highlightColor: Colors.blue,
                      splashColor: Colors.amber,
                      child: new Text(
                        "Subtract",
                      ),
                    )),
              )
            ],
          )),
    );
  }

  void subtractNumbers() {
    //  if(Platform.isAndroid)
    // if (Platform.isIOS)
  }
}

const String BASE64_IMAGE =
    "data:image/jpeg;base64,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";
