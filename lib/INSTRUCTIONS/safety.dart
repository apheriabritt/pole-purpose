import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';

class Safety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
             appBar: hamburger,

      body: Material(
          color: Colors.white,
          child: SafeArea(
            child: Center(
              child: Image.asset(
                'images/pageimages/safety.png',
                fit: BoxFit.fill,
              ),
            ), 
                  
          ),
        ),
    );
  }
}