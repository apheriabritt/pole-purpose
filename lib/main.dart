import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

import 'BROWSE CARDS/BrowseCards.dart';


void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));

}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  wp.WordPress wordPress = wp.WordPress(
    baseUrl: 'https://polepurpose.com',
  );


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new SafeArea(
      child: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new AfterSplash(),
        image: Image.asset('images/assets/splash.png'),
        backgroundColor: Colors.white,
        photoSize: MediaQuery.of(context).size.height/4,
        loaderColor: Colors.black,
        loadingText: Text(
          "Loading",
          style: new TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      )
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BrowseCards(),
    );
  }
}