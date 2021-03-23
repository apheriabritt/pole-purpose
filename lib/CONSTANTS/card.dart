import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';

///i might re enter the card info into a FBDB.
//then get the card widget

Widget SingleCard(String id){
  return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: FlipCard(
            front: Card(child: Center(child: Column(
              children: [
                Text(id),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                      'images/assets/splash.png', height: MediaQuery
                      .of(context)
                      .size
                      .width),
                ),
              ],
            )), elevation: 10,),
            back: Card(child: Center(child: Text(id)), elevation: 10,),
          ),
        );
      });
}

