import 'package:firebase_database/firebase_database.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';

///i might re enter the card info into a FBDB.
//then get the card widget

Widget SingleCard(String id){
  return StatefulBuilder(
      builder: (context, setState) {
        ///get card info from DB with the key id?
        ///or just DB in here...
        String name=id;
        if(id=='0'){name='card 0';}
        if(id=='1'){name='card 1';}
        if(id=='2'){name='card 2';}
        if(id=='3'){name='card 3';}
        if(id=='4'){name='card 4';}
        if(id=='5'){name='card 5';}
        if(id=='6'){name='card 6';}

        String info;
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                            'images/cards/$id.png',fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(name),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                            'images/cards/$id.png',fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1),
                      ),
                    ],
                  )), elevation: 10,),
              ),
            ),
          ),
        );
      });
}

