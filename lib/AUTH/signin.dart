
import 'package:flutter/material.dart';
import 'package:pole_purpose/AUTH/services.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  //text field state

  String email =  '';
  String password ='';
  String error ='';

  void ForgotPassword() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
              title: new Text("forgot password?",style: TextStyle(fontFamily: 'apheriafont', fontSize: 30.0,color: Colors.blue),),
              content: new Text("send an email to britt@adapt.co.uk and i will send you a password reset link :)",style: TextStyle(fontFamily: 'apheriafont', fontSize: 20.0,color: Colors.black),),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("ok!",style: TextStyle(fontFamily: 'apheriafont', fontSize: 30.0,color: Colors.blue),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },

                )]);});}

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Image.asset('images/assets/splash.png',height:MediaQuery.of(context).size.height/2),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.black.withOpacity(0.75),
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text('make an account', style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap:(){
                    widget.toggleView();
                  },
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration:InputDecoration(hintText: 'email'),
                  validator: (val) =>  val.isEmpty ? 'enter an email' : null,
                  onChanged: (val){
                    setState(() => email = val);
                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration:InputDecoration(hintText: 'password'),
                  validator: (val) =>  val.length < 6 ? 'please enter a password longer than 6 characters' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => password = val);
                  }
              ),
              SizedBox(height: 20.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.black.withOpacity(0.75),
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text('sign in', style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward, color: Colors.white),
                    onTap: () async {
                      if (_formkey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if (result == null){
                          setState(() {
                            error = 'could not sign in with those credentials';
                            loading = false;
                          });
                        }
                      }
                    }
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.black.withOpacity(0.75),
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: ListTile(
                    leading: Icon(Icons.help, color: Colors.white),
                    title: Text('forgot password!', style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward, color: Colors.white),
                    onTap: ForgotPassword
                ),
              ),

            ],
          )
      )
      ),
    );
  }
}

