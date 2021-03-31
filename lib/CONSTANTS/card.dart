import 'package:firebase_database/firebase_database.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';

///i might re enter the card info into a FBDB.
//then get the card widget
Widget SingleCard(String id,title,content){
  return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          //height:MediaQuery.of(context).size.height,
          //width:MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onLongPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: customAppBarjustback,
                          extendBodyBehindAppBar: true,
                          body: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(child: SingleCard( id,title,content)),
                          )
                        )));
              },
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: FittedBox(
                  child: Container(
                    height:1000,width:650,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(title,style:TextStyle(fontFamily: 'Xtreem',fontSize:75)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:
                          //Image.network(image,fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1)
                          Image.asset('images/assets/CARDS/$id.png',fit:BoxFit.fill),
                        ),
                      ],
                    )), elevation: 10,),
                  ),
                ),
                back: FittedBox(
                  child: Container(
                    height:1000,width:650,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(title,style:TextStyle(fontFamily: 'Xtreem',fontSize:75)),
                          ),
                          Container(
                            height:800,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child:
                                Center(child: SingleChildScrollView(child: Text(content,style:TextStyle(fontSize: 35))))
                              //Image.network(image,fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1)
                            ),
                          ),
                        ],
                      )), elevation: 10,),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

