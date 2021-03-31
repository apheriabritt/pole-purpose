
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/AUTH/services.dart';
import 'package:pole_purpose/BROWSE%20CARDS/BrowseCards.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
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