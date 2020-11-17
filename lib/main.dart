import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:pole_purpose/HomePage.dart';
import 'package:flutter/services.dart';

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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new SafeArea(
      child: SplashScreen(
        seconds: 5,
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
      home: HomePage(),
    );
  }
}