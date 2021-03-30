import 'package:firebase_database/firebase_database.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';

///i might re enter the card info into a FBDB.
//then get the card widget
bool loading=true;
Widget SingleCard(String id,title,content){
  return StatefulBuilder(
      builder: (context, setState) {

        ///get fb info using id.
      getData() async{
        print('getting card data');
      await FirebaseDatabase.instance
          .reference()
          .child('cards/$id/title')
          .once()
          .then((snapshot){title=snapshot.value;});
      await FirebaseDatabase.instance
          .reference()
          .child('cards/$id/content')
          .once()
          .then((snapshot){content=snapshot.value;});
        loading=false;
      }
      getData();

        return loading==true?Container():Container(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: FittedBox(
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(id,style:TextStyle(fontFamily: 'Xtreem',fontSize:50)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:
                        //Image.network(image,fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1)
                        Image.asset('images/assets/CARDS/$id.png',fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1),
                      ),
                    ],
                  )), elevation: 10,),
                ),
              ),
              back: FittedBox(
                ///do this at the end
              ),
            ),
          ),
        );
      });
}

