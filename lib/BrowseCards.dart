import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:math';
import 'widget/card.dart';
import 'package:pole_purpose/randomcard.dart';
import 'randomcard.dart';
import 'package:pole_purpose/services/playSound.dart';

class BrowseCards extends StatefulWidget {
  @override
  _BrowseCardsState createState() => _BrowseCardsState();
}

int randomCard = 1;
int n = 6;

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

  Widget randomButton() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          child: Icon(
            CupertinoIcons.shuffle_thick,
            color: Colors.black,
            size: 30,
          ),
          onTap: () {
            buttonPressed();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RandomCard(),
              ),
            );
          },
        ),
      ),
    );
  }

  buttonPressed() {
    setState(() {
      int min = 1;
      int max = 25;
      randomCard = min + Random().nextInt(max - min);
      if (n == randomCard) {
        print(randomCard);
      }
      Image.asset('images/cards/$randomCard.png');
      Image.asset('images/cards/cardbacks/back$randomCard.png');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CupertinoNavigationBar(
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
          middle: const Text('Browse Cards',
              style: TextStyle(
                  fontFamily: 'GillSansMT',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ),
        body: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Container(
                    child: Swiper.children(
                      onIndexChanged: (i) => {_sound.playLocal("shuffle.mp3")},
                      viewportFraction: 1.0,
                      scale: 1.0,
                      children: <Widget>[
                        CardWidget(context).showActionCard(),
                        CardWidget(context).showCard(2),
                        CardWidget(context).showCard(3),
                        CardWidget(context).showCard(4),
                        CardWidget(context).showCard(5),
                        CardWidget(context).showEverydayCard(),
                        CardWidget(context).showCard(7),
                        CardWidget(context).showCard(8),
                        CardWidget(context).showCard(9),
                        CardWidget(context).showCard(10),
                        CardWidget(context).showCard(11),
                        CardWidget(context).showCard(12),
                        CardWidget(context).showCard(13),
                        CardWidget(context).showCard(14),
                        CardWidget(context).showCard(15),
                        CardWidget(context).showCard(16),
                        CardWidget(context).showCard(17),
                        CardWidget(context).showCard(18),
                        CardWidget(context).showCard(19),
                        CardWidget(context).showCard(20),
                        CardWidget(context).showCard(21),
                        CardWidget(context).showCard(22),
                        CardWidget(context).showNumberCard(),
                        CardWidget(context).showEveryday2Card(null),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
