
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pole_purpose/AUTH/authenticate.dart';
import 'package:pole_purpose/BROWSE%20CARDS/BrowseCards.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}
bool loading=true;

class _WrapperState extends State<Wrapper> {
  User user;
  String pushtoken;
  int _total = 0;
  List uidList=[];
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;
  int count=0;


  void initState() {
    super.initState();
getUserData();
  }


  void getUserData() async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
await firebaseMessaging.getToken().then((token){
      print("wrapper token: ${token}");
      pushtoken=token;
    });
    if(user!=null){
      print('found user. uploading info to database.');
      //check uid to see if star points are registered
      //if uid is not registered, create uid with shared pref total as counter
      //if uid is registered, leave it
      //take shared preferences star points out of it all together
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User user = auth.currentUser;

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data =
    {
      "uid": user.uid,
      "username": user.displayName,
      "email": user.email,
      "pushid": pushtoken

    };
    await ref.child("user info").child(user.uid).set(data);
      setState(() {
        loading=false;
      });
  }
    else{
      print('no user found. no upload taking place.');

      setState(() {
        loading=false;
      });
    }



  }
  @override
 Widget build(BuildContext context) {
    print('wrapper');
    return loading==true?Loading():
    user==null? Authenticate():
    BrowseCards();
    ///ive put get user data into homepage instead
  }
}
