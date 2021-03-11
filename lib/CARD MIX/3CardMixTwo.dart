import 'package:flutter/material.dart';
import 'file:///D:/projects/pole-purpose/lib/CARD%20MIX/savedSetsPage.dart';
import 'dart:math';
import '../widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pole_purpose/data/savedModels.dart';
import 'package:pole_purpose/services/savedDatabase.dart';
import 'package:flutter_icons/flutter_icons.dart';

int randomCard1 = 0;
int randomCard2 = 0;
int randomCard3 = 0;

bool randomSet = false;

class CardMixTwo extends StatefulWidget {
  final int card1;
  final int card2;
  final int card3;
  final int id;

  CardMixTwo(this.card1, this.card2, this.card3, this.id);

  @override
  _CardMixTwoState createState() => _CardMixTwoState(card1, card2, card3, id);
}

class _CardMixTwoState extends State<CardMixTwo> {
  final int card1;
  final int card2;
  final int card3;
  final int id;

  _CardMixTwoState(this.card1, this.card2, this.card3, this.id); //constructor

  clickOnSaveButton(int index) {
    randomSet = false;
    if (index < 0) {
      SavedDatabaseService.db.getNextAvailableId().then((value) =>
      (SavedDatabaseService.db.addSavedSetInDB(SavedModel(
          id: value,
          card1: randomCard1,
          card2: randomCard2,
          card3: randomCard3))));
    } else {
      SavedDatabaseService.db.addSavedSetInDB(SavedModel(
          id: index,
          card1: randomCard1,
          card2: randomCard2,
          card3: randomCard3));
    }
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => SavedSets()));
  }

  handleDelete() {
    SavedDatabaseService.db.deleteNoteInDB(id);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => SavedSets()));
  }

  Widget randomButton() {
    if (card1 > 0) return Text("");
    if (card2 > 0) return Text("");
    if (card3 > 0) return Text("");

    return Container(
      child: SafeArea(
        child: GestureDetector(
          child: Icon(
            CupertinoIcons.shuffle_thick,
            color: Colors.black,
            size: (MediaQuery.of(context).size.height > 900) ? 32 : 24,
          ),
          onTap: () {
            clickRandomButton();
          },
        ),
      ),
    );
  }

  Widget iconDelete() {
    return (!randomSet && card1 > 0)
        ? Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SafeArea(
        child: GestureDetector(
          onTap: handleDelete,
          child: Icon(
            CupertinoIcons.delete_simple,
            color: Colors.red,
            size: (MediaQuery.of(context).size.height > 900) ? 60 : 30,
          ),
        ),
      ),
    )
        : Text("");
  }

  Widget saveButton() {
    return (randomSet)
        ? Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SafeArea(
        child: GestureDetector(
          child: Icon(
            MaterialIcons.save,
            color: Colors.deepPurpleAccent,
            size: (MediaQuery.of(context).size.height > 900) ? 60 : 30,
          ),
          onTap: () {
            clickOnSaveButton(randomSet ? -1 : this.id);
          },
        ),
      ),
    )
        : Text("");
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
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          padding: EdgeInsetsDirectional.only(start: 0, end: 0),
          leading: FlatButton(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 90,
              height: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          trailing: randomButton(),
          middle: const Text('3 Card Mix',
              style: TextStyle(
                fontFamily: 'GillSansMT',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ),
        child: SafeArea(
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
