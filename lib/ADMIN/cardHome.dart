import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/ADMIN/uploadCards.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';



class ViewPPCards extends StatefulWidget {
  @override
  _ViewPPCardsState createState() => _ViewPPCardsState();
}

class _ViewPPCardsState extends State<ViewPPCards> {
  List<PPCard> ppcardList = [];

  String name;
  int price;
  File image;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    print('here');
    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
        "cards");
    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      ppcardList.clear();

      for (var individualKey in KEYS) {
        PPCard ppcard = new PPCard(
          DATA[individualKey]['title'],
          DATA[individualKey]['image'],
          DATA[individualKey]['id'],
          DATA[individualKey]['content'],


        );
        ppcardList.add(ppcard);
      }
      print('Length: $ppcardList.length');
      setState(() {

      });
    });}



  @override
  Widget build(BuildContext context) {
    PPCard data=PPCard(null,null,null,null);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBarjustback,
        floatingActionButton:
        FloatingActionButton(
            heroTag: 'add',
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPPCards(data:data)),
              );
            },//addppcard
            backgroundColor:Colors.black,
            child:Icon(Icons.add,color:Colors.white)),
        body:  ppcardList.length == 0 ? Center(child: Text('no cards')) :
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            children: [
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ppcardList.length,
                  itemBuilder: (_, index) {
                    return PPCardsUI(
                        ppcardList[index].title,
                        ppcardList[index].image,
                        ppcardList[index].id,
                        ppcardList[index].content,


                    );

                  }
              ),
              SizedBox(height:100)
            ],
          ),
        )

    );
  }
}


Widget PPCardsUI(String title,image,id,content) {
  {
    PPCard data;
    data = PPCard(title,image,id,content);

    return  Stack(
      children: [
        Card(
            elevation: 10,
            color: Colors.white.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Text(title,style:TextStyle(color: Colors.black)),
                      ]),
                ],
              ),
            )
        ),
        Positioned(
          right:0,
          bottom:0,
          child: StatefulBuilder(
              builder: (context, setState) {
                return FloatingActionButton(
                  mini:true,
                    backgroundColor: Colors.black,
                    heroTag: id,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPPCards(data:data)),
                      );
                    },
                    child: Icon(Icons.edit, color: Colors.white) //edit ppcard,
                );
              }),
        ),
        Positioned(
          left:0,
          bottom:0,
          child: StatefulBuilder(
              builder: (context, setState) {

                void delete(){
                  DatabaseReference ref = FirebaseDatabase.instance.reference();
                  ref.child("cards").child(id.toString()).remove();
                }


                void deletecheck(){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: Colors.white.withOpacity(1),
                          title: new Text("just checking...", style: TextStyle(
                               
                              fontSize: 30.0,
                              color: Colors.black),),
                          content: Container(
                            height:200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new Text("are you sure you want to delete?",
                                  style: TextStyle( 
                                      fontSize: 25.0,
                                      color: Colors.black),),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlatButton(
                                      child: new Text("no...", style: TextStyle(
                                           
                                          fontSize: 30.0,
                                          color: Colors.black),),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },

                                    ),
                                    FlatButton(
                                      child: new Text("yes", style: TextStyle(
                                           
                                          fontSize: 30.0,
                                          color: Colors.black),),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        delete();
                                      },

                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }



                return FloatingActionButton(
                  mini:true,
                    backgroundColor: Colors.black,
                    heroTag: '${id}delete',
                    onPressed: deletecheck,

                    child: Icon(Icons.delete, color: Colors.white) //edit ppcard,
                );
              }),
        )
      ],
    );

  }}