import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color:Colors.white,
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/assets/splash.png',width:250),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('loading...',style: TextStyle(fontSize:20),),
              )
            ],
          )
        )
      ),
    );
  }
}
