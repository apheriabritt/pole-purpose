
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pole_purpose/AUTH/services.dart';
import 'package:pole_purpose/AUTH/wrapper.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';
import 'package:provider/provider.dart';
bool loading=true;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;
  int count=0;
  int _total = 0;
  List uidList=[];


  void firebaseMessagingSetup() async {
    ///set up android and ios firebase messaging
    var android = AndroidNotificationDetails(
        'all', 'all', 'all',
        playSound:false,
        color: Colors.black,
        enableVibration: false,
        styleInformation: BigTextStyleInformation(''),
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'test ticker');

    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    firebaseMessaging.configure(
      ///onmessage
      onMessage: (Map<String, dynamic> message) async{
        print("onMessage: $message");
        await flutterLocalNotificationsPlugin.show(
            count, '${message['notification']['title']}',
            '${message['notification']['body']}', platform,
            payload: 'payload');
      },
      onLaunch: (Map<String, dynamic> message) async{
        print("onLaunch: $message");
        await flutterLocalNotificationsPlugin.show(
            count, '${message['notification']['title']}',
            '${message['notification']['body']}', platform,
            payload: 'payload');
      },
      onResume: (Map<String, dynamic> message) async{
        print("onResume: $message");
        await flutterLocalNotificationsPlugin.show(
            count, '${message['notification']['title']}',
            '${message['notification']['body']}', platform,
            payload: 'payload');
      },
    );
    firebaseMessaging.getToken().then((token){
      print("token: ${token}");
    });
    firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    setState(() {
      loading=false;
    });
  }

  @override
  void initState() {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);
    ///set up:
    firebaseMessagingSetup();
  }

  Future onSelectNotification(String payload) {
    ///Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    ///return NewScreen(
    ///payload: payload,
    ///);
    ///}));
  }




  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return loading!=false?Loading():StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'GillSansMT', primaryColor: Colors.white,
            accentColor: Colors.black,),
          home: Wrapper(),
        ));
  }
}

///
///