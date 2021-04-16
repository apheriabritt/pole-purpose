
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/AUTH/services.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;




  //text field state

  String email =  '';
  String password ='';
  String error ='';
  bool tick = false;



  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
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
                      leading: Icon(Icons.arrow_back, color: Colors.white),
                      title: Text('back to sign in', style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.person, color: Colors.white),
                      onTap:(){
                        widget.toggleView();
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(cursorColor: Colors.black,
                      decoration:InputDecoration(hintText: 'email'),
                      validator: (val) =>  val.isEmpty ? 'enter an email' : null,
                      onChanged: (val){
                        setState(() => email = val);
                      }
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(cursorColor: Colors.black,
                      decoration:InputDecoration(hintText: 'password'),
                      validator: (val) =>  val.length < 6 ? 'please enter a password longer than 6 characters' : null,
                      obscureText: true,
                      onChanged: (val){
                        setState(() => password = val);
                      }
                  ),
                  SizedBox(height: 20.0),
                  CheckboxListTile(
                      title:Text('Tick the box to subscribe to our newsletter and receive a free training video'),
                      value: tick,
                      onChanged: (value){
                        if(tick==false){
                          setState(() {
                            tick=true;
                          });
                        }
                        else if(tick==true){
                          setState(() {
                            tick=false;
                          });
                        }

                      }),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.black.withOpacity(0.75),
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: ListTile(
                        leading: Icon(Icons.person, color: Colors.white),
                        title: Text('register', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.arrow_forward, color: Colors.white),
                        onTap: () async{
                          if (_formkey.currentState.validate()){
                            setState(() => loading = true);
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            if(result == null) {
                              setState(() {
                                error = 'please supply a valid email';
                                loading = false;
                              });
                            }
                            if(tick==true){
                              //add to mailing list
                              final FirebaseAuth auth = FirebaseAuth.instance;
                              FirebaseUser user = await auth.currentUser();
                              DatabaseReference ref = FirebaseDatabase.instance.reference();
                              var data =
                              {
                                "uid": user.uid.toString(),
                                "email": user.email.toString(),

                              };

                              await ref.child("mailing list").child(user.uid.toString()).set(data);
                              print('added to mailing list');
                            }
                            else{print('not added');}
                          }
                        }
                    ),
                  ),
                  SizedBox(height: 12.0),
                  error==''?Container():Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.red.withOpacity(0.75),
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        error,
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }
}