import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            'Intro',
              style: TextStyle(fontFamily: 'GillSansMT', fontWeight: FontWeight.bold, fontSize: 18)
          ),
           leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),

        ),
        child: Material(
          color: Colors.white,
          child: SafeArea(
            child: Center(
              child: Image.asset(
                'images/pageimages/intro.png',
                fit: BoxFit.fill,
              ),
            ), 
                  
          ),
        )
    );
  }
}
