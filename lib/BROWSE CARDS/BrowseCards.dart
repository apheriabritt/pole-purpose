import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pole_purpose/BROWSE%20CARDS/favourites.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';
import 'dart:math';
import '../CONSTANTS/card.dart';
bool single=true;
bool faveToggle=false;
Widget cardIcon = Image.network('https://i.postimg.cc/vT2PYTQr/oie-transparent-1.png');
var faveIcon = Icons.favorite_border;

class BrowseCards extends StatefulWidget {
  @override
  _BrowseCardsState createState() => _BrowseCardsState();
}

List<String> CardList =['1','2','3'];
List faveList=[];
String currentCard;
int currentCard1index=0;
int currentCard2index=0;
int currentCard3index=0;


// ignore: missing_return

class _BrowseCardsState extends State<BrowseCards> {


  PlaySound _sound = PlaySound();

  String currentCard1;
  String currentCard2;
  String currentCard3;


String setName;
  List threecardkeylist=[];



  @override
  Widget build(BuildContext context) {
    ///this needs to be the list of cards with their details... just put it into FB.


    currentCard=CardList.first;


    currentCard1=CardList[currentCard1index];
    currentCard2=CardList[currentCard2index];
    currentCard3=CardList[currentCard3index];
    setName = '$currentCard1$currentCard2$currentCard3';


    print('current card is $currentCard');
    print('current card 1 is $currentCard1');
    print('current card 2 is $currentCard2');
    print('current card 3 is $currentCard3');

    List<Widget> WidgetCardList = [];
    CardList.forEach((item){
      print('item is $item');
     Widget WidgetA = SingleCard(item);
      WidgetCardList.add(WidgetA);});
///need a list of ids. i guess from fb. (like faves) then show those ids via SingleCard. CardList will contain ids.
    ///Widget list

   Widget card1=WidgetCardList[currentCard1index];
   Widget card2=WidgetCardList[currentCard2index];
   Widget card3=WidgetCardList[currentCard3index];

    var singleCard=

    Padding(
      padding: EdgeInsets.all(33),
    child:
    Swiper.children(
        viewportFraction: 0.95,
        scale: 0.9,
        onIndexChanged: (i) {

          _sound.playLocal("shuffle.mp3");
          print('hi');
          currentCard=CardList[i];

        },
        children:
          WidgetCardList
    ));
    var threeCard=
   Padding(
     padding: EdgeInsets.all(50),
       child:Stack(
    children:[
        Positioned(
          child: Transform.scale(
            scale: 0.4,
            alignment: Alignment.topRight,
            child: Transform.rotate(
                angle:pi/12,
                child: card1),
          ),
        ),
      Transform.scale(
        scale: 0.4,
        alignment: Alignment.center,
        child: Transform.rotate(
            angle:-pi/12,
            child: card2),
      ),
      Transform.scale(
        scale: 0.4,
        alignment: Alignment.bottomLeft,
        child: Transform.rotate(
            angle:pi/12,
            child: card3),
      )
    ]));



    ////////
    bool appbar=false;

    void isFaved() async{
      final FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseUser user = await auth.currentUser();
      if(single==true){
        DatabaseReference ref = FirebaseDatabase.instance.reference();
        String faveListString;
        await ref
            .child('favourites/SINGLE/${user.uid}/faveList')
            .once()
            .then((snapshot){faveListString=snapshot.value;});
        if (faveListString==null){faveListString='[]';}
        faveList = await json.decode(faveListString);
        //= CardList.first.key.toString();
        if(faveList.contains(currentCard)){
          print('this card is faved');
          setState(() {
            faveIcon=Icons.favorite;
          });
        }
        else{
          print('this card is not faved');
          setState(() {
            faveIcon=Icons.favorite_border;
              });

      }
    }
    else{
        threecardkeylist.clear();
        print('cleared list: $threecardkeylist');
        DatabaseReference postsRef2 = FirebaseDatabase.instance.reference().child(
            "favourites/MIX/${user.uid}");
        await postsRef2.once().then((DataSnapshot snap) {
          print('snap is $snap');
          if(snap.value==null){
            setState(() {
              faveIcon=Icons.favorite_border;
            });
          }
          if(snap.value!=null){
            var KEYS = snap.value.keys;
            var DATA = snap.value;
            for (var individualKey in KEYS) {
              String threecardkey=DATA[individualKey]['id'];
              print('key is: ${DATA[individualKey]['id']}');
              threecardkeylist.add(threecardkey);}
              print('set name is $setName');
            bool match;
              if(threecardkeylist.contains(setName)){
                print('MATCH');
                match =true;
                setState(() {
                  faveIcon=Icons.favorite;
                });
              }
              else if(match!=true){
                print('NO MATCH');
              setState(() {
                faveIcon=Icons.favorite_border;
                });}
              }

            });
        print('got em');
      }
    }
    isFaved();


    return Scaffold(extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: hamburger,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton:
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: FloatingActionButton.extended(
                  label:Text('favourites'),
                    heroTag:'list',
                    backgroundColor: Colors.black,
                    onPressed: (){
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return Favourites();
                          }));
                    },
                    icon:Icon(Icons.favorite)
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: FloatingActionButton.extended(
                    label:Text('view all'),
                    heroTag:'viewall',
                    backgroundColor: Colors.black,
                    onPressed: (){
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return Scaffold(
                                floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
                                floatingActionButton: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                  child: FloatingActionButton(
                                      child:Icon(Icons.arrow_back),
                                      backgroundColor: Colors.black,
                                      onPressed:(){Navigator.pop(context);}
                                  ),
                                ),
                                body:Center(child:
                                Transform.scale(
                                  scale:1,
                                  child:Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                                    child: StaggeredGridView.countBuilder(
                                      crossAxisCount: 4,
                                      itemCount: CardList.length,
                                      itemBuilder: (BuildContext context, int index) => Card(
                                        elevation: 0.0,
                                        color: Colors.transparent,
                                         child:Stack(
                                            children: <Widget>[
                                              Transform.scale(
                                                  scale:1,
                                                  child: SingleCard(CardList[index])),
                                              //FAB
                                            ],
                                        ),
                                      ),
                                      staggeredTileBuilder: (int index) =>
                                      new StaggeredTile.fit(2),
                                      mainAxisSpacing: 4.0,
                                      crossAxisSpacing: 4.0,
                                    ),
                                  ),
                                )
                                )
                            );
                          }));
                    },
                    icon:Icon(Icons.grid_on)
                ),
              ),
            ],

          ),
        ),
      body: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 9,
                 child: Scaffold(extendBodyBehindAppBar: true,
                   backgroundColor: Colors.transparent,
                      bottomNavigationBar:Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                         FloatingActionButton(
                                onPressed:() {
                                  if (single == true) {
                                    print('change to group');
                                    setState(() {
                                      single = false;
                                      cardIcon=Image.network('https://i.postimg.cc/G3jn0xvR/oie-transparent.png');                                    });}
                                    //switch to single or to group, also change the icon
                                  else{
                                setState(() {
                                  print('change to single');
                                single = true;
                                cardIcon=Image.network('https://i.postimg.cc/vT2PYTQr/oie-transparent-1.png');
                                });}
                                },
                                  heroTag: 'switch',
                                  child: cardIcon,backgroundColor: Colors.white),
                             FloatingActionButton(
                                heroTag: 'homeshuffle',
                                onPressed: (){
                                  _sound.playLocal("shuffle.mp3");
                                  CardList.shuffle();
                                  currentCard1index=Random().nextInt(CardList.length);
                                  currentCard2index=Random().nextInt(CardList.length);
                                  currentCard3index=Random().nextInt(CardList.length);
                                  setState(() {
                                  });
                                },
                                child: Icon(CupertinoIcons.shuffle_thick,size:35),backgroundColor: Colors.black,),
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  heroTag: 'faveit',
                                  child:Icon(faveIcon,color:Colors.black),
                                  onPressed:() async{
                                    ///get single fave list. if currentcard is in list, fill heart
                                    ///need to show alert and fill heart
                                    ///need to show icon if already favourites and cant do anything with it or maybe unfave
                                    print('card to be faved is $currentCard');
                                    final FirebaseAuth auth = FirebaseAuth.instance;
                                    FirebaseUser user = await auth.currentUser();
                                    print(user.uid);
                                    //print(CardList.first.key.toString());
                                    //get fave data
                                    //add current key to that list
                                    //upload list to database
                                    print('single is $single');
                                    if(single==true){
                                      DatabaseReference ref = FirebaseDatabase.instance.reference();
                                      String faveListString;
                                      await ref
                                          .child('favourites/SINGLE/${user.uid}/faveList')
                                          .once()
                                          .then((snapshot){faveListString=snapshot.value;});
                                      if (faveListString==null){faveListString='[]';}
                                      faveList = await json.decode(faveListString);
                                      //= CardList.first.key.toString();
                                      if(faveList.contains(currentCard)){
                                        faveList.remove(currentCard);
                                        faveIcon=Icons.favorite_border;
                                      }
                                      else{faveList.add(currentCard);}
                                      faveList = faveList.toSet().toList();
                                      //remove duplicates
                                      faveListString = json.encode(faveList);
                                      var data =
                                      {
                                        "faveList": faveListString,
                                      };

                                      await ref.child("favourites").child('SINGLE').child(user.uid).set(data);
                                      print('here hmm');
                                    }
                                    else{
                                      bool match;
                                      if(threecardkeylist.contains(setName)){
                                        match=true;
                                        FirebaseDatabase.instance.reference().child("favourites").child('MIX').child(user.uid).child(setName).remove();
                                        setState(() {
                                          faveIcon=Icons.favorite_border;
                                        });
                                      }
                                      else if(match!=true){
                                      setState(() {
                                        faveIcon=Icons.favorite;
                                      });
                                      ///3 card mix...find a way to light up the heart... i guess same as before
                                      DatabaseReference ref = FirebaseDatabase.instance.reference();

                                      print('set name is: $setName');

                                      //remove duplicates
                                      var data =
                                      {
                                        "card1": currentCard1,
                                        "card2": currentCard2,
                                        "card3": currentCard3,
                                        "id" : setName

                                      };

                                      await ref.child("favourites").child('MIX').child(user.uid).child(setName).set(data);

                                    }}

                                  },
                                )
                          ])),
                      body:
                          Stack(
                              children: [

                              single==true?singleCard:threeCard,


                              ])
                    ),
                  )
              ],
            ),
          ),
        ),
    );
  }
}

