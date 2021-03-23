import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';

///i might re enter the card info into a FBDB.
//then get the card widget

Widget SingleCard(String id){
  return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: FittedBox(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(child: Column(
                  children: [
                    Text(id),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                            'images/assets/splash.png',fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1),
                    ),
                  ],
                )), elevation: 10,),
              ),
              back: FittedBox(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(child: Column(
                    children: [
                      Text(id),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                            'images/assets/splash.png',fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1),
                      ),
                    ],
                  )), elevation: 10,),
              ),
            ),
          ),
        );
      });
}

