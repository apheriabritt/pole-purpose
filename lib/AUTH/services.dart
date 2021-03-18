import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/AUTH/register.dart';
import 'package:pole_purpose/AUTH/signin.dart';

class User {

  final String uid;

  User({this.uid});
}

class UserData {

  final String uid;
  final String username;

  UserData({this.uid,this.username});
}

class DBUserInfo

{

  String uid,username,avatar,email;

  DBUserInfo(this.uid,this.username,this.avatar,this.email);

}

class Username {

  final String username;

  Username({this.username});

}

class FedInData

{

  String uid,username,avatar;

  FedInData(this.uid,this.username,this.avatar);

}

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


//create user object based on firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user !=null ? User(uid: user.uid) : null;
  }
//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //register email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document for the user with the uid
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;


    }
  }
}


class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

