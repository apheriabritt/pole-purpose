
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pole_purpose/AUTH/services.dart';
import 'package:pole_purpose/BROWSE%20CARDS/BrowseCards.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  FirebaseUser user;
  bool loading=true;
  String pushtoken;
  int _total = 0;
  List uidList=[];
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;
  int count=0;


  void initState() {
    super.initState();
    getUserData();
    Future.delayed(const Duration(seconds: 3), () {
      // deleayed code here
    });

  }


  void getUserData() async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = await auth.currentUser();
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
    await firebaseMessaging.getToken().then((token){
      print("wrapper token: ${token}");
      pushtoken=token;
    });
    if(user!=null){
      print('database');
      //check uid to see if star points are registered
      //if uid is not registered, create uid with shared pref total as counter
      //if uid is registered, leave it
      //take shared preferences star points out of it all together
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseUser user = await auth.currentUser();

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data =
    {
      "uid": user.uid,
      "username": user.displayName,
      "avatar": user.photoUrl,
      "email": user.email,
      "pushid": pushtoken

    };
    ref.child("user info").child(user.uid).set(data);
    setState(() {
      loading=false;
    });
  }}

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (user == null) {
            return Authenticate();
          }
          else {
            return BrowseCards();
          }
        }
    );
  }
}
