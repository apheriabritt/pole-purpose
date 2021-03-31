import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';

class PushCentre extends StatefulWidget {
  @override
  _PushCentreState createState() => _PushCentreState();
}

class _PushCentreState extends State<PushCentre> {
  String title;
  String description;
  final formKey = new GlobalKey<FormState>();
  List pushList=[];

  @override
  void initState() {
    super.initState();

    //add all current registered pushids to list
    DatabaseReference db = FirebaseDatabase.instance.reference().child("user info");
    db.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        pushList.add(values["pushid"]);
      });
      print('push list: ${pushList}');
    });  }


  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    else {
      return false;
    }
  }


  Future<bool> sendPush() async {
    //this need to be send to all
    final String serverToken = 'AAAApkGJuVA:APA91bGCrv3EOkqOX_ik5PZsG7kmKdSVMgjXk3aWrCVEqsUPREX6VYH0FbTrBHlnhDiGniTnApUjZY9uFyg4YsS9dkKnyL75q8m1U12L8A6hZhVkWs_0EwRpY9Q_Yj2HCByNO1tLreIJ';
    final postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "registration_ids" : pushList, //link to firebase list. create a list of all. get tokens from user info?
      "collapse_key" : "type_a",
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "notification" : {
        "title": title,
        "body" : description,
      }

    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=$serverToken',
    };

    final response = await http.post(postUrl,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      print('push sent! :)');
      return true;
    } else {
      print('push did not send :(');
      // on failure do sth
      return false;
    }
  }
  void upload() async{
    var dbTimeKey = new DateTime.now();
    var formatDate = new DateFormat('MMM d, yyyy');
    var formatTime = new DateFormat('hh:mm aaa');


    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    int id=DateTime.now().millisecondsSinceEpoch;

    var uploaddata =
    {
      "push title": title,
      "push description": description,
      "push date":date,
      "push time":time,
      "push id":id,

    };
    ref.child("push notifications").child(id.toString()).update(uploaddata);
    Navigator.of(context).pop();
    sendPush();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarjustback,
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton.extended(onPressed: () {
          if (validateAndSave()) {
            upload();
          }}, label: Text('send to all',style:TextStyle(color:Colors.white,fontSize: 25)),backgroundColor: Colors.black,),
        body:Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key:formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    SizedBox(height:100),
                    Icon(Icons.notifications_active,color:Colors.black,size: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('send a push notification:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(cursorColor: Colors.black,
                        initialValue: title,
                        decoration: InputDecoration(hintText: 'title'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'write something!';
                          }
                          return null;
                        },
                        onSaved: (value)
                        {
                          return title = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(cursorColor: Colors.black,
                        initialValue: description,
                        maxLines: 3,
                        decoration: InputDecoration(hintText: 'description'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'write something!';
                          }
                          return null;
                        },
                        onSaved: (value)
                        {
                          return description = value;
                        },
                      ),
                    ),

                  ]
              ),
            ),
          ),
        )
    );
  }
}