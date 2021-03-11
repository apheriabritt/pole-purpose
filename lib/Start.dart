import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/projects/pole-purpose/lib/CARD%20MIX/3CardMix.dart';
import 'package:pole_purpose/screens/intructions.dart';

import 'package:pole_purpose/PickACard.dart';
import 'services/savedInstructions.dart';

import 'dart:math';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  SavedInstructions prefs = SavedInstructions();

  int randomCard1 = 1;
  int randomCard2 = 1;
  int randomCard3 = 1;
  buttonPressed() {
    setState(() {
      int min1 = 1;
      int min2 = 7;
      int min3 = 14;
      int max1 = 6;
      int max2 = 13;
      int max3 = 23;
      randomCard1 = min1 + Random().nextInt(max1 - min1);
      randomCard2 = min2 + Random().nextInt(max2 - min2);
      randomCard3 = min3 + Random().nextInt(max3 - min3);
      Image.asset('images/cards/$randomCard1.png');
      Image.asset('images/cards/cardbacks/back$randomCard1.png');
      Image.asset('images/cards/$randomCard2.png');
      Image.asset('images/cards/cardbacks/back$randomCard2.png');
      Image.asset('images/cards/$randomCard3.png');
      Image.asset('images/cards/cardbacks/back$randomCard3.png');
    });
  }

  onPickACardPress() async {
    bool show = await prefs.getShowInstructions();

    if (show)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Intructions()));
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PickACard()));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.only(start: 0, end: 0),
        leading: FlatButton(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 90,
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                CupertinoIcons.back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        middle: const Text('Start',
            style: TextStyle(
                fontFamily: 'GillSansMT',
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Image.asset('images/Start-Your-Journey.png'),
            ),
            Hero(
              tag: "single-card",
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor:
                Colors.transparent, // makes highlight invisible too
                onPressed: onPickACardPress,
                child: Image.asset('images/Pick-A-Card.png'),
              ),
            ),
            Hero(
              tag: "set",
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor:
                Colors.transparent, // makes highlight invisible too
                onPressed: () {
                  buttonPressed();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardMix(-1, -1, -1, -1)));
                },
                child: Image.asset('images/3-Card-Mix.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
