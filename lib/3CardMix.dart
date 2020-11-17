import 'package:flutter/material.dart';
import 'dart:math';
import 'widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'savedSetsMain.dart';
import 'package:pole_purpose/data/savedModels.dart';
import 'package:pole_purpose/services/savedDatabase.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pole_purpose/services/playSound.dart';
import 'package:pole_purpose/3CardMixTwo.dart';

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
        context, CupertinoPageRoute(builder: (context) => SavedSetsMain()));
  }

  handleDelete() {
    SavedDatabaseService.db.deleteNoteInDB(id);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => SavedSetsMain()));
  }

  Widget randomButton() {
    if (card1 > 0) return Text("");
    if (card2 > 0) return Text("");
    if (card3 > 0) return Text("");
    return FlatButton(
      padding: EdgeInsets.all(0),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(
        CupertinoIcons.shuffle_thick,
        color: Colors.black,
        size: (MediaQuery.of(context).size.height > 900) ? 32 : 24,
      ),
      onPressed: () {
        clickRandomButton();
      },
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
            color: Colors.black,
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
            color: Colors.black,
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

    _sound.playLocal("shuffle.mp3");
  }

  onSetClick(int card) {
    if (randomSet) {
      if (card == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CardMixTwo(randomCard1, randomCard2, randomCard3, id)));
      } else if (card == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CardMixTwo(randomCard2, randomCard3, randomCard1, id)));
      } else if (card == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CardMixTwo(randomCard3, randomCard1, randomCard2, id)));
      }
    }
    if (!randomSet && (card1 > 0)) {
      if (card == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardMixTwo(card1, card2, card3, id)));
      } else if (card == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardMixTwo(card2, card3, card1, id)));
      } else if (card == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardMixTwo(card3, card1, card2, id)));
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
                    fontSize: 18)),
          ),
          child: GestureDetector(
            onTap: randomAllScreen,
            child: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    saveButton(),
                    iconDelete(),
                  ],
                ),
                Expanded(
                  child: Hero(
                    tag: (id < 0) ? "set" : "set_$id",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => onSetClick(1),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 3 - 5,
                              height: MediaQuery.of(context).size.height,
                              child: CardWidget(context).showCardSetNotFlip(
                                  randomSet || card2 > 0 ? 1 : 0,
                                  [card1, card2, card3],
                                  [randomCard1, randomCard2, randomCard3])),
                        ),
                        GestureDetector(
                          onTap: () => onSetClick(2),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 5,
                            height: MediaQuery.of(context).size.height,
                            child: CardWidget(context).showCardSetNotFlip(
                                randomSet || card2 > 0 ? 2 : 0,
                                [card1, card2, card3],
                                [randomCard1, randomCard2, randomCard3]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => onSetClick(3),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 5,
                            height: MediaQuery.of(context).size.height,
                            child: CardWidget(context).showCardSetNotFlip(
                                randomSet || card3 > 0 ? 3 : 0,
                                [card1, card2, card3],
                                [randomCard1, randomCard2, randomCard3]),
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
