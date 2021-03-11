import 'package:flutter/material.dart';
import 'package:pole_purpose/CARD%20MIX/CardFocus.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';
import 'dart:math';
import '../CONSTANTS/card.dart';
import 'package:flutter/cupertino.dart';


int randomCard1 = 0;
int randomCard2 = 0;
int randomCard3 = 0;

class CardMix extends StatefulWidget {
  final int card1;
  final int card2;
  final int card3;
  final int id;

  CardMix(this.card1, this.card2, this.card3, this.id);

  @override
  _CardMixState createState() => _CardMixState(card1, card2, card3, id);
}

class _CardMixState extends State<CardMix> {
  final int card1;
  final int card2;
  final int card3;
  final int id;

  _CardMixState(this.card1, this.card2, this.card3, this.id); //constructor

  bool randomSet = false;

  PlaySound _sound = PlaySound();




  Widget randomButton() {
    if (card1 > 0) return Text("");
    if (card2 > 0) return Text("");
    if (card3 > 0) return Text("");
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag:'shuffle',
           backgroundColor: Colors.black,
            child: Icon(
              CupertinoIcons.shuffle_thick,
              color: Colors.white,
              size: (MediaQuery.of(context).size.height > 900) ? 32 : 24,
            ),
            onPressed: () {
              clickRandomButton();
            },
          ),
        ),
      ],
    );
  }




  clickRandomButton() {
    setState(() {
      int min1 = 1;
      int max1 = 8;

      int min2 = 8;
      int min3 = 16;

      int max2 = 16;
      int max3 = 24;

      randomCard1 = min1 + Random().nextInt(max1 - min1);
      randomCard2 = min2 + Random().nextInt(max2 - min2);
      randomCard3 = min3 + Random().nextInt(max3 - min3);

      randomSet = true;
    });

    _sound.playLocal("shuffle.mp3");
  }

  onSetClick(int card) {
    if (randomSet) {
      if (card == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CardFocus(randomCard1, randomCard2, randomCard3, id)));
      } else if (card == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CardFocus(randomCard2, randomCard3, randomCard1, id)));
      } else if (card == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CardFocus(randomCard3, randomCard1, randomCard2, id)));
      }
    }
    if (!randomSet && (card1 > 0)) {
      if (card == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardFocus(card1, card2, card3, id)));
      } else if (card == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardFocus(card2, card3, card1, id)));
      } else if (card == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardFocus(card3, card1, card2, id)));
      }
    }
  }

  randomAllScreen() {
    if (randomSet) {
      return;
    }
    if (!randomSet && (card1 > 0)) {
      return;
    }
    clickRandomButton();
  }

  @override
  Widget build(BuildContext context) {
    if (card1 < 0) {
      clickRandomButton();
    }
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          // Returning true allows the pop to happen, returning false prevents it.
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: hamburger,
          floatingActionButton: randomButton(),
          body: GestureDetector(
            onTap: randomAllScreen,
            child: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                SizedBox(height:30),
                Expanded(
                  child: Hero(
                    tag: (id < 0) ? "set" : "set_$id",
                    child: Column(
                      children: <Widget>[
                        Transform.rotate(
                          angle:pi/8,
                          child: GestureDetector(
                            onTap: () => onSetClick(1),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height/3.75,
                                child: CardWidget(context).showCardSetNotFlip(
                                    randomSet || card2 > 0 ? 1 : 0,
                                    [card1, card2, card3],
                                    [randomCard1, randomCard2, randomCard3])),
                          ),
                        ),
                        Transform.rotate(
                          angle:-pi/8,
                          child: GestureDetector(
                            onTap: () => onSetClick(2),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/3.75,
                              child: CardWidget(context).showCardSetNotFlip(
                                  randomSet || card2 > 0 ? 2 : 0,
                                  [card1, card2, card3],
                                  [randomCard1, randomCard2, randomCard3]),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle:pi/8,
                          child: GestureDetector(
                            onTap: () => onSetClick(3),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/3.75,
                              child: CardWidget(context).showCardSetNotFlip(
                                  randomSet || card3 > 0 ? 3 : 0,
                                  [card1, card2, card3],
                                  [randomCard1, randomCard2, randomCard3]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
