
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pole_purpose/AUTH/services.dart';
import 'package:pole_purpose/AUTH/wrapper.dart';
import 'package:provider/provider.dart';


void main() {
  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp( MyApp()));
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
  int start;
  bool play;
  int _total = 0;
  List uidList=[];

  @override
  void initState() {
    super.initState();
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'all', 'all', 'all',
            playSound:false,
            color: Colors.black,
            enableVibration: false,
            styleInformation: BigTextStyleInformation(''),
            importance: Importance.Max,
            priority: Priority.High,
            ticker: 'test ticker');


        var iOSChannelSpecifics = IOSNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(
            androidPlatformChannelSpecifics, iOSChannelSpecifics);
        print(DateTime.now().millisecondsSinceEpoch,);

        final FirebaseAuth auth = FirebaseAuth.instance;
        final FirebaseUser user = await auth.currentUser();
        String uid = user.uid;
        String recurringcheck='${message['notification']['title']}';
        if(recurringcheck.contains('daily')){
          print('this notification is daily');
          //wipe previous notifications here...
          await flutterLocalNotificationsPlugin.cancelAll();
          //get time from recurring notifications database.

          String minute = (await FirebaseDatabase.instance.reference().child(
              "recurring notifications/${uid}/minute").once()).value;
          String hour = (await FirebaseDatabase.instance.reference().child(
              "recurring notifications/${uid}/hour").once()).value;

          //format time
          int hourint=int.parse(hour);
          int minuteint=int.parse(minute);

          print('hour int: ${hourint}');

          Time time = Time(hourint,minuteint,0);

          await flutterLocalNotificationsPlugin.showDailyAtTime(
              count, '${message['notification']['title']}',
              '${message['notification']['body']}',time, platformChannelSpecifics,
              payload: 'test oayload');

        }




        ////
        else{
          print('this notification is NOT recurring');
          await flutterLocalNotificationsPlugin.show(
              0, '${message['notification']['title']}',
              '${message['notification']['body']}', platformChannelSpecifics,
              payload: 'test oayload');


        }


        //dialog
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'all', 'all', 'all',
            playSound:false,
            enableVibration: false,
            styleInformation: BigTextStyleInformation(''),
            importance: Importance.Max,
            priority: Priority.High,
            ticker: 'test ticker');


        var iOSChannelSpecifics = IOSNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(
            androidPlatformChannelSpecifics, iOSChannelSpecifics);
        print(DateTime.now().millisecondsSinceEpoch,);
        final FirebaseAuth auth = FirebaseAuth.instance;
        final FirebaseUser user = await auth.currentUser();
        String uid = user.uid;
        String recurringcheck='${message['notification']['title']}';

        if(recurringcheck.contains('recurring')){
          print('this notification is recurring');

          //wipe previous notifications here...
          await flutterLocalNotificationsPlugin.cancelAll();
          //get time from recurring notifications database.

          String minute = (await FirebaseDatabase.instance.reference().child(
              "recurring notifications/${uid}/minute").once()).value;
          String hour = (await FirebaseDatabase.instance.reference().child(
              "recurring notifications/${uid}/hour").once()).value;

          //format time
          int hourint=int.parse(hour);
          int minuteint=int.parse(minute);

          print('hour int: ${hourint}');

          Time time = Time(hourint,minuteint,0);

          await flutterLocalNotificationsPlugin.showDailyAtTime(
              count, '${message['notification']['title']}',
              '${message['notification']['body']}',time, platformChannelSpecifics,
              payload: 'test oayload');

        }
        else{
          print('this notification is NOT recurring');
          await flutterLocalNotificationsPlugin.show(
              0, '${message['notification']['title']}',
              '${message['notification']['body']}', platformChannelSpecifics,
              payload: 'test oayload');


        }



      },
      onResume: (Map<String, dynamic> message) async {
        print('RESUME');
        print("onResume: $message");
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'all', 'all', 'all',
            playSound:false,
            enableVibration: false,
            styleInformation: BigTextStyleInformation(''),
            importance: Importance.Max,
            priority: Priority.High,
            ticker: 'test ticker');


        var iOSChannelSpecifics = IOSNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(
            androidPlatformChannelSpecifics, iOSChannelSpecifics);
        print(DateTime.now().millisecondsSinceEpoch,);
        final FirebaseAuth auth = FirebaseAuth.instance;
        final FirebaseUser user = await auth.currentUser();
        String uid = user.uid;
        String recurringcheck='${message['notification']['title']}';


        if(recurringcheck.contains('recurring')){
          print('this notification is recurring');

          //wipe previous notifications here...
          await flutterLocalNotificationsPlugin.cancelAll();
          //get time from recurring notifications database.

          String minute = (await FirebaseDatabase.instance.reference().child(
              "recurring notifications/${uid}/minute").once()).value;
          String hour = (await FirebaseDatabase.instance.reference().child(
              "recurring notifications/${uid}/hour").once()).value;

          //format time
          int hourint=int.parse(hour);
          int minuteint=int.parse(minute);

          print('hour int: ${hourint}');

          Time time = Time(hourint,minuteint,0);

          await flutterLocalNotificationsPlugin.showDailyAtTime(
              count, '${message['notification']['title']}',
              '${message['notification']['body']}',time, platformChannelSpecifics,
              payload: 'test oayload');

        }
        else{
          print('this notification is NOT recurring');
          await flutterLocalNotificationsPlugin.show(
              0, '${message['notification']['title']}',
              '${message['notification']['body']}', platformChannelSpecifics,
              payload: 'test oayload');


        }



      },
    );

    firebaseMessaging.getToken().then((token){
      print('got token');
    });

    firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    ///INIT AWESOME NOTIFICATIONS

    ///AWESOME NOTIFICATIONS FINISH//////////////
    _createNotificationChannel();

    ///LOCAL NOTIFICATIONS START
    initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    print('configuring cloud messaging...');

    ///LOCAL NOTIFICATIONS END
    ///otherr stuff:
    ///
  }

  Future<void> _createNotificationChannel() async {
    var androidNotificationChannel = AndroidNotificationChannel(
      'all',
      'all',
      'all',
      playSound:false,
      enableVibration: false,
      importance: Importance.Max,

    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);


  }

  Future<void> showRecurringNotification() async {

  }

  Future onSelectNotification(String payload) async {

  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
  }




  @override
  Widget build(BuildContext context) {
    //constant widget that shows the current workout if there is one?
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(textTheme: TextTheme(
              subhead: TextStyle(fontFamily: 'apheriafont', fontSize: 22),
              body1: TextStyle(fontFamily: 'apheriafont', fontSize: 18))),
          home: Wrapper(),
        ));
  }
}