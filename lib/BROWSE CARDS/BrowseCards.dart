import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pole_purpose/ADMIN/uploadCards.dart';
import 'package:pole_purpose/BROWSE%20CARDS/favourites.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';
import 'dart:math';
import '../CONSTANTS/card.dart';
bool single=true;
bool faveToggle=false;
List<PPCard> CardList = [];
int currentCard1index=0;
int currentCard2index=0;
int currentCard3index=0;
List faveList=[];
var singleCard;
var threeCard;

Widget cardIcon = Image.network('https://i.postimg.cc/vT2PYTQr/oie-transparent-1.png');
var faveIcon = Icons.favorite_border;

class BrowseCards extends StatefulWidget {
  @override
  _BrowseCardsState createState() => _BrowseCardsState();
}



bool loading=true;
Widget card1;
Widget card2;
Widget card3;


// ignore: missing_return

class _BrowseCardsState extends State<BrowseCards> {
  PlaySound _sound = PlaySound();
  String setName;
  List threecardkeylist=[];


  void initState() {
  getData();
  }


  void isFaved() async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser user = await auth.currentUser();
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

      if(faveList.contains(CardList[currentCard1index].id)){
          print('current card is ${CardList[currentCard1index].id}');
          print('fave list is $faveList');
          print('match!');
          faveIcon=Icons.favorite;
      }
      else{
          print('current card is ${CardList[currentCard1index].id}');
          print('fave list is $faveList');
          print('no match!');
          faveIcon=Icons.favorite_border;

      }
    }
    else{
      threecardkeylist.clear();
      DatabaseReference postsRef2 = FirebaseDatabase.instance.reference().child(
          "favourites/MIX/${user.uid}");
      await postsRef2.once().then((DataSnapshot snap) {
        if(snap.value==null){
            faveIcon=Icons.favorite_border;
        }
        if(snap.value!=null){
          var KEYS = snap.value.keys;
          var DATA = snap.value;
          for (var individualKey in KEYS) {
            String threecardkey=DATA[individualKey]['id'];
            threecardkeylist.add(threecardkey);}
          bool match;
          print('three card fave list is $threecardkeylist');
          print('currently showing set: $setName');
          if(threecardkeylist.contains(setName)){
            print('match');
            match =true;
              faveIcon=Icons.favorite;
          }
          else if(match!=true){
            print('no match');
              faveIcon=Icons.favorite_border;
            }
        }

      });
    }
    setState(() {

    });
  }

    void getData() async {
    print('hello!');

      DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
          "cards");
    print('oopsy');

    await postsRef.once().then((DataSnapshot snap) {
        var KEYS = snap.value.keys;
        var DATA = snap.value;
       CardList.clear();
        for (var individualKey in KEYS) {
          PPCard ppcard = new PPCard(
            DATA[individualKey]['title'],
            DATA[individualKey]['image'],
            DATA[individualKey]['id'],
            DATA[individualKey]['content'],
          );
          CardList.add(ppcard);
        }
        print('Length: ${CardList.length}');
      });

      currentCard1index=Random().nextInt(CardList.length);
      currentCard2index=Random().nextInt(CardList.length);
      currentCard3index=Random().nextInt(CardList.length);
      card1=SingleCard(CardList[currentCard1index].id,CardList[currentCard1index].title,CardList[currentCard1index].content);
      card2=SingleCard(CardList[currentCard2index].id,CardList[currentCard2index].title,CardList[currentCard2index].content);
      card3=SingleCard(CardList[currentCard3index].id,CardList[currentCard3index].title,CardList[currentCard3index].content);
      setName = '${CardList[currentCard1index].id}${CardList[currentCard2index].id}${CardList[currentCard3index].id}';
      print('index 1 is $currentCard1index');
      print('at start up, new card is ${CardList[currentCard1index].title}');
      print('at start up, card mix is $setName');
    singleCard=
    Padding(
        padding: EdgeInsets.fromLTRB(35, 65, 35, 35),
        child:
        new Swiper(
          onIndexChanged: (index) async{
            await getData();
            setState(() {
            });
          },
          itemBuilder: (BuildContext context,int index){
            return Center(child: SingleCard(CardList[currentCard1index].id,CardList[currentCard1index].title,CardList[currentCard1index].content));
          },
          itemCount: 1,
        ),  );
    threeCard=
    Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child:Container(
          height:MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width,
          child: Column(
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Transform.rotate(
                                angle:pi/12,
                                child: Container(
                                    height:MediaQuery.of(context).size.height/4,
                                    child: card1)),
                         Container(),
                       ],
                     ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Transform.rotate(
                              angle:-pi/20,
                              child: Container(
                                  height:MediaQuery.of(context).size.height/4,
                                  child: card2)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(),
                          Transform.rotate(
                              angle:pi/12,
                              child: Container(
                                  height:MediaQuery.of(context).size.height/4,
                                  child: card3)),
                        ],
                      ),
                ]),
          ),
        );
      await isFaved();
      setState(() {
        loading=false;
      });
    }




  @override
  Widget build(BuildContext context) {
    return loading==true?Loading():Scaffold(extendBodyBehindAppBar: true,
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
                                                  child: SingleCard(CardList[index].id,CardList[index].title,CardList[index].content)),
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
                                    setState(() {
                                      single = false;
                                      isFaved();
                                      cardIcon=Image.network('https://i.postimg.cc/G3jn0xvR/oie-transparent.png');
                                    });}
                                    //switch to single or to group, also change the icon
                                  else{
                                setState(() {
                                single = true;
                                isFaved();
                                cardIcon=Image.network('https://i.postimg.cc/vT2PYTQr/oie-transparent-1.png');
                                });}
                                },
                                  heroTag: 'switch',
                                  child: cardIcon,backgroundColor: Colors.white),
                             FloatingActionButton(
                                heroTag: 'homeshuffle',
                                onPressed: () async{
                                  print('shuffle!');
                                  _sound.playLocal("shuffle.mp3");
                                  await getData();
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
                                    final FirebaseAuth auth = FirebaseAuth.instance;
                                    FirebaseUser user = await auth.currentUser();
                                    //print(CardList.first.key.toString());
                                    //get fave data
                                    //add current key to that list
                                    //upload list to database
                                    if(single==true){
                                      DatabaseReference ref = FirebaseDatabase.instance.reference();
                                      String faveListString;
                                      await ref
                                          .child('favourites/SINGLE/${user.uid}/faveList')
                                          .once()
                                          .then((snapshot){faveListString=snapshot.value;});
                                      if (faveListString==null){faveListString='[]';}
                                      faveList = await json.decode(faveListString);
                                      print('hii');
                                      //= CardList.first.key.toString();
                                      print('fave list is $faveList');
                                      String doomcard = CardList[currentCard1index].id;
                                      print('card is $doomcard');
                                      if(faveList.contains(doomcard)){
                                        print('removing');
                                        faveList.remove(doomcard);
                                        faveIcon=Icons.favorite_border;
                                        faveList = faveList.toSet().toList();
                                        //remove duplicates
                                        faveListString = json.encode(faveList);
                                        var data =
                                        {
                                          "faveList": faveListString,
                                        };

                                        await ref.child("favourites").child('SINGLE').child(user.uid).set(data);
                                        print('removed');
                                        setState(() {

                                        });
                                      }
                                      else{
                                        faveIcon=Icons.favorite;
                                        faveList.add(doomcard);
                                        faveList = faveList.toSet().toList();
                                        //remove duplicates
                                        faveListString = json.encode(faveList);
                                        print('adding $faveListString');

                                        var data =
                                        {
                                          "faveList": faveListString,
                                        };

                                        await ref.child("favourites").child('SINGLE').child(user.uid).set(data);
                                        print('added');
                                        setState(() {

                                        });
                                      }


                                    }
                                    else{
                                      bool match;
                                      String doom1=CardList[currentCard1index].id;
                                      String doom2=CardList[currentCard2index].id;
                                      String doom3=CardList[currentCard3index].id;

                                      String doom1title=CardList[currentCard1index].title;
                                      String doom2title=CardList[currentCard2index].title;
                                      String doom3title=CardList[currentCard3index].title;

                                      String doom1content=CardList[currentCard1index].content;
                                      String doom2content=CardList[currentCard2index].content;
                                      String doom3content=CardList[currentCard3index].content;

                                      if(threecardkeylist.contains(setName)){
                                        print('removing');
                                        match=true;
                                        FirebaseDatabase.instance.reference().child("favourites").child('MIX').child(user.uid).child(setName).remove();
                                        setState(() {
                                          isFaved();
                                          faveIcon=Icons.favorite_border;
                                        });
                                      }
                                      else if(match!=true){
                                        print('adding');
                                      setState(() {
                                        isFaved();
                                        faveIcon=Icons.favorite;
                                      });
                                      ///3 card mix...find a way to light up the heart... i guess same as before
                                      DatabaseReference ref = FirebaseDatabase.instance.reference();


                                      //remove duplicates
                                      var data =
                                      {
                                        "card1": doom1,
                                        "card2":doom2,
                                        "card3": doom3,
                                        "card1title": doom1title,
                                        "card2title":doom2title,
                                        "card3title": doom3title,
                                        "card1content": doom1content,
                                        "card2content":doom2content,
                                        "card3content": doom3content,
                                        "id" : setName

                                      };

                                      await ref.child("favourites").child('MIX').child(user.uid).child(setName).set(data);
                                      setState(() {
                                      });

                                    }}

                                  },
                                )
                          ])),
                      body:
                         loading==true?Loading(): Stack(
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

