import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            'Copyright',
            style: TextStyle(
              fontFamily: 'GillSansMT', fontWeight: FontWeight.bold, fontSize: 18 
            ),
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
        child: SafeArea(
          child:Image.asset(
          'images/pageimages/about.png',
          fit: BoxFit.cover,
        )));
  }
}