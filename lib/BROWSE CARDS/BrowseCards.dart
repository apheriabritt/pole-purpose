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
class BrowseCards extends StatefulWidget {
  @override
  _BrowseCardsState createState() => _BrowseCardsState();
}

List<String> CardList;
List faveList=[];

void getCards() async{

}


// ignore: missing_return

class _BrowseCardsState extends State<BrowseCards> {
  var backTextTitle = ["", "Action", "Descriptive Words", "Everyday Movement", "Everyday Movements"];
  var backTextList = [
    "",
    "Rub, sink, rise, melt, bend, stretch, twist, swing, push, pull, rock, balance, shake, float, duck, dodge, jab, poke, shove, carve, freeze, wiggle, turn, fall, straighten, strike, chop, spin, kick, punch, wring, tickle, hug, hang, sway, open, close, flap, pluck, tap, grab, wrap, flick, pose, burst, glide, shrug, dig, blot, flee, chase, dash, hurl, gallop, bounce, rush, sail, plummet, scramble, smash, soar, speed, still, spring, sprint, skip, zoom, whisk, stride, jump, cat walk, shuffle, tip toe, grow, wriggle, polka, waddle, slither, swoon, prance, drag, tense, slow, land, burn, hold, escape, lift, restrict, flight, roll, suspend, collapse, trap, fling, weave, nail, squash, lean, tangle, low, fold, pop, cluster, bind, hop, weld, plant, stack, squeeze, draw out, spread, wedge, fading, shaded, sharp, hard, grotesque, obscure, weak, old, cold, young, flash, shadow, broken, excite, clarify, fragment, reverse, inversion, duration, position, compose, carry, allow, explore, light, heavy, space, shape, break, overlap, dominance, submission, force, follow, resist, ignore, run, repetition, under, behind, reach, lengthen, beyond, inside, outside, explain, mould, add, exaggerate, crawl, merge, absorb, abrupt, rearrange, lines, curves, sudden, jagged, smooth, continuous, even, relax, split, leave and re-enter.",
    "Choose four everyday movements such as waving to somebody or putting clothes on. Write them down and begin to form each idea with your body.Try to play with the size and the speed at which you perform the movement as this will really allow you to create something that is not so literal.Once you are comfortable with how the movements look and the order in which they are linked together, think about performing them at different points next to or on the pole. How can the pole enhance this movement? Could you try executing these gestures in an invert or in an upright position on the pole?See example card for every day movement inspiration, but first try to think of some yourself as it will develop your creative potential.",
    "The Everyday Movement card can be used to expand your imagination from a stylised genre of movement, such as typical pole dance technique, to a more pedestrian style of movement that will offer fruitful ways of enhancing your pole and floor work.  Allow this card to really expand the way you think about movement. Ask yourself what can be considered dance and how you could communicate more effectively by employing some of these everyday gestures.Check watch, check e-mail, check current devices, cross and uncross legs, doodle, fiddle (play) with jewellery, sigh, hold breath, talk to self, twirl hair, move hair out of face, crack neck, lean forward, lean back or away, shrug shoulders, roll head, turn head, tilt head, rub neck, touch (drop) chin to chest, bat eyes, roll eyes, wipe off sweat, massage forehead, rub temples, play with beard or moustache, pull (tug) on ear, smooth eyebrows, wink, wipe away tears, choke, tighten, or grip jaw, swallow, put finger to lips (in thought or to shush someone), sip tea or coffee (other drinks), gulp down alcoholic drink, smile, smoke, push hair behind ears, mess with barrettes or ribbons or hats, push hair off face (own face or the face of others), hold someone’s hand, rub hands together, rub hands up and down arms, up and down legs, snap fingers, suck thumb or finger, tap or drum fingers on self or object, toss ball (or other object) hand to hand, trace scars or injuries, shake, or point finger, wrap arms around own body, wring hand, putting on clothes and taking clothes off.",
    ""
  ];

  PlaySound _sound = PlaySound();
  String currentCard;

  String currentCard1;
  String currentCard2;
  String currentCard3;

  int currentCard1index;
  int currentCard2index;
  int currentCard3index;
  var faveIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    ///this needs to be the list of cards with their details... just put it into FB.
    CardList =['test 1','test 2','test 3'];
    CardList.shuffle();

    currentCard=CardList.first;
    currentCard1index=Random().nextInt(CardList.length);
    currentCard2index=Random().nextInt(CardList.length);
    currentCard3index=Random().nextInt(CardList.length);

    currentCard1=CardList[currentCard1index];
    currentCard2=CardList[currentCard2index];
    currentCard3=CardList[currentCard3index];

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
     padding: EdgeInsets.all(25),
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
    CardList.shuffle();


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
                                         child:Column(
                                            children: <Widget>[
                                              Transform.scale(
                                                  scale:1,
                                                  child: SingleCard(CardList[index])),
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
                                  setState(() {
                                  });
                                },
                                child: Icon(CupertinoIcons.shuffle_thick,size:35),backgroundColor: Colors.black,),
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  heroTag: 'faveit',
                                  child:Icon(faveIcon,color:Colors.black),
                                  onPressed:() async{
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
                                      faveList.add(currentCard);
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
                                      ///3 card mix
                                      DatabaseReference ref = FirebaseDatabase.instance.reference();

                                      String setName = '$currentCard1$currentCard2$currentCard3';
                                      print('set name is: $setName');

                                      //remove duplicates
                                      var data =
                                      {
                                        "card1": currentCard1,
                                        "card2": currentCard2,
                                        "card3": currentCard3,

                                      };

                                      await ref.child("favourites").child('MIX').child(user.uid).child(setName).set(data);
                                    }

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

