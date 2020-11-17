import 'dart:math';
import 'widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/BrowseCards.dart';
import 'package:pole_purpose/services/playSound.dart';

class RandomCard extends StatefulWidget {
  @override
  _RandomCardState createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  PlaySound _sound = PlaySound();

  buttonPressed() {
    setState(() {
      int min = 1;
      int max = 25;
      randomCard = min + Random().nextInt(max - min);
      Image.asset('images/cards/$randomCard.png');
      Image.asset('images/cards/cardbacks/back$randomCard.png');
    });
    _sound.playLocal("shuffle.mp3");
  }

  Widget randomButton() {
    return FlatButton(
      padding: EdgeInsets.all(0),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(
        CupertinoIcons.shuffle_thick,
        color: Colors.black,
        size: (MediaQuery.of(context).size.height > 900) ? 32 : 24,
      ),
      onPressed: () {
        buttonPressed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
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
          middle: const Text('Random Card',
              style: TextStyle(
                  fontFamily: 'GillSansMT',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          trailing: randomButton(),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Hero(
                  tag: "single-card",
                  child: Container(
                    child: CardWidget(context).selectCard(randomCard),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
