import 'package:flutter/material.dart';
import 'dart:math';
import '../CONSTANTS/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_icons/flutter_icons.dart';

int randomCard1 = 0;
int randomCard2 = 0;
int randomCard3 = 0;

bool randomSet = false;

class CardFocus extends StatefulWidget {
  final int card1;
  final int card2;
  final int card3;
  final int id;

  CardFocus(this.card1, this.card2, this.card3, this.id);

  @override
  _CardFocusState createState() => _CardFocusState(card1, card2, card3, id);
}

class _CardFocusState extends State<CardFocus> {
  final int card1;
  final int card2;
  final int card3;
  final int id;

  _CardFocusState(this.card1, this.card2, this.card3, this.id); //constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child:Icon(Icons.arrow_back,color:Colors.white),
            onPressed:(){Navigator.pop(context);}
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Swiper.children(
              viewportFraction: 1.0,
              children: <Widget>[
                Hero(
                  tag: "first_card",
                  child: CardWidget(context).showCardSet(
                      randomSet || card1 > 0 ? 1 : 0,
                      [card1, card2, card3],
                      [randomCard1, randomCard2, randomCard3]),
                ),
                CardWidget(context).showCardSet(
                    randomSet || card2 > 0 ? 2 : 0,
                    [card1, card2, card3],
                    [randomCard1, randomCard2, randomCard3]),
                CardWidget(context).showCardSet(
                    randomSet || card3 > 0 ? 3 : 0,
                    [card1, card2, card3],
                    [randomCard1, randomCard2, randomCard3]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
