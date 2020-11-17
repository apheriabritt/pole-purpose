import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/services/playSound.dart';

class CardWidget {
  final BuildContext context;

  CardWidget(this.context);

  PlaySound _sound = PlaySound();

  ScrollController _controller = ScrollController();

  Widget showActionCard() {
    return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front: Image.asset('images/cards/1.png'),
      back: Padding(
        padding: const EdgeInsets.fromLTRB(10, 120, 10, 120),
        child: Card(
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.black, width: 2),
    borderRadius: BorderRadius.circular(20)),
          color:Colors.white,
            shadowColor: Colors.black,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: <Widget>[
                Text('Action & Descriptive Words (font needed)',style:TextStyle(fontSize: 22)),
                            SizedBox(height: 10),
                            Text(
                              "Action",
                              style: TextStyle(
                                fontFamily: 'GillSansMT',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: (MediaQuery.of(context).size.height > 900)
                                    ? 36
                                    : 18,
                              ),
                            ),
                            Text(
                              "Utilise this card to play with quality of movement.If you always tend to move with smooth and flowing lines, how could you disrupt the flow by thinking about a jagged or sudden dynamic? This could alter something as simple as an arm raise.",
                              style: TextStyle(
                                fontFamily: 'GillSansMT',
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: (MediaQuery.of(context).size.height > 900)
                                    ? 30
                                    : 14,
                              ),
                            ),
                            Text(" "),
                            Text(
                              "Descriptive Words",
                              style: TextStyle(
                                fontFamily: 'GillSansMT',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: (MediaQuery.of(context).size.height > 900)
                                    ? 36
                                    : 18,
                              ),
                            ),
                            Text(
                              "Rub, sink, rise, melt, bend, stretch, twist, swing, push, pull, rock, balance, shake, float, duck, dodge, jab, poke, shove, carve, freeze, wiggle, turn, fall, straighten, strike, chop, spin, kick, punch, wring, tickle, hug, hang, sway, open, close, flap, pluck, tap, grab, wrap, flick, pose, burst, glide, shrug, dig, blot, flee, chase, dash, hurl, gallop, bounce, rush, sail, plummet, scramble, smash, soar, speed, still, spring, sprint, skip, zoom, whisk, stride, jump, cat walk, shuffle, tip toe, grow, wriggle, polka, waddle, slither, swoon, prance, drag, tense, slow, land, burn, hold, escape, lift, restrict, flight, roll, suspend, collapse, trap, fling, weave, nail, squash, lean, tangle, low, fold, pop, cluster, bind, hop, weld, plant, stack, squeeze, draw out, spread, wedge, fading, shaded, sharp, hard, grotesque, obscure, weak, old, cold, young, flash, shadow, broken, excite, clarify, fragment, reverse, inversion, duration, position, compose, carry, allow, explore, light, heavy, space, shape, break, overlap, dominance, submission, force, follow, resist, ignore, run, repetition, under, behind, reach, lengthen, beyond, inside, outside, explain, mould, add, exaggerate, crawl, merge, absorb, abrupt, rearrange, lines, curves, sudden, jagged, smooth, continuous, even, relax, split, leave and re-enter.",
                              style: TextStyle(
                                fontFamily: 'GillSansMT',
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: (MediaQuery.of(context).size.height > 900)
                                    ? 30
                                    : 14,
                              ),
                            ),
        ]),
            )),
      )
    );
  }
bool appbar=false;
  Widget showEverydayCard() {
    return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front: Image.asset('images/cards/6.png'),
      back: Padding(
        padding: const EdgeInsets.fromLTRB(10, 120, 10, 120),
        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            color:Colors.white,
            shadowColor: Colors.black,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: <Widget>[
                Text('Everyday Movements (font needed)',style:TextStyle(fontSize: 25)),
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      appbar=true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showEveryday2Card(appbar)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text("Tap here to see example card for every day movement inspiration, but first try to think of some yourself as it will develop your creative potential."),
                    ),
                  ),
                ),
                SizedBox(height: 010,),
                Text(
                  "text goes here",
                  style: TextStyle(
                    fontFamily: 'GillSansMT',
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

              ]),
            )),
      )
    );
  }


  Widget showEveryday2Card(bool appbar) {
    return Scaffold(
      appBar: appbar!=true?PreferredSize(child:Container(),preferredSize: Size(0,0),): CupertinoNavigationBar(
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
      ),
     backgroundColor:Colors.white,
      body: FlipCard(
        onFlip: () => _sound.playLocal("shuffle.mp3"),
        direction: FlipDirection.HORIZONTAL, // default
        //front: Image.asset('images/cards/24.png'),
        front: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset('images/cards/24.png'),
          ),
        ),
        back:
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 120, 10, 120),
          child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              color:Colors.white,
              shadowColor: Colors.black,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(children: <Widget>[
                  Text('Everyday Movements (font needed)',style:TextStyle(fontSize: 25)),
                  SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                  ),
                  SizedBox(height: 010,),
                  Text(
                    "The Everyday Movement card can be used to expand your imagination from a stylised genre of movement, such as typical pole dance technique, to a more pedestrian style of movement that will offer fruitful ways of enhancing your pole and floor work. \n\nAllow this card to really expand the way you think about movement. Ask yourself what can be considered dance and how you could communicate more effectively by employing some of these everyday gestures.\n\nCheck watch, check e-mail, check current devices, cross and uncross legs, doodle, fiddle (play) with jewellery, sigh, hold breath, talk to self, twirl hair, move hair out of face, crack neck, lean forward, lean back or away, shrug shoulders, roll head, turn head, tilt head, rub neck, touch (drop) chin to chest, bat eyes, roll eyes, wipe off sweat, massage forehead, rub temples, play with beard or moustache, pull (tug) on ear, smooth eyebrows, wink, wipe away tears, choke, tighten, or grip jaw, swallow, put finger to lips (in thought or to shush someone), sip tea or coffee (other drinks), gulp down alcoholic drink, smile, smoke, push hair behind ears, mess with barrettes or ribbons or hats, push hair off face (own face or the face of others), hold someone’s hand, rub hands together, rub hands up and down arms, up and down legs, snap fingers, suck thumb or finger, tap or drum fingers on self or object, toss ball (or other object) hand to hand, trace scars or injuries, shake, or point finger, wrap arms around own body, wring hand, putting on clothes and taking clothes off.",
                    style: TextStyle(
                      fontFamily: 'GillSansMT',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                ]),
              )),
        )
      ),
    );
  }

  Widget showNumberCard() {
    return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front: Image.asset('images/cards/23.png'),
      back: Padding(
    padding: const EdgeInsets.fromLTRB(10, 120, 10, 120),        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            color:Colors.white,
            shadowColor: Colors.black,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: <Widget>[
                Text("What's your number? (font needed)",style:TextStyle(fontSize: 25)),
                SizedBox(height: 10),
                Text(
                  "Using your mobile phone number, and the representations of the numbers below, you are going to create a motif of movement.\n\n0. Balance\n1. Swing\n2. Any Invert\n3. Falling\n4. Roll\n5. Travel\n6. Stillness\n7. Leg movement\n8. Isolation of any body part\n9. Basic spin\n\nIf your number was 07658952145, your motif would be: Balance » leg movement » stillness » isolation » basic spin » travel » any invert » swing » roll » travel.\n\nOnce you have your movement, allow each movement to flow organically from one to the other. What is the most direct route to get there? How close or far away from the pole would you have to be to start? How big or small would your movement have to be in order to get you to that next part of the motif?\n\nThis can be manipulated so there is pole movement only. Change the representation of each number to suit floor movement, pole movement or both. You could also use the action card for some ideas if you get stuck.\n\nTry with your phone number at first, but if you find that your number is too repetitive, it’s ok to change a couple of digits.",
                  style: TextStyle(
                    fontFamily: 'GillSansMT',
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ]),
            )),
      ),
    );
  }

  Widget showCard(int card) {
    return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front: Image.asset('images/cards/$card.png'),
      back: Padding(
        padding: const EdgeInsets.fromLTRB(10, 120, 10, 120),
        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            color:Colors.white,
            shadowColor: Colors.black,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: <Widget>[
                Text('Title (font needed)',style:TextStyle(fontSize: 25)),
                SizedBox(height: 10),
                Text(
                  "text goes here",
                  style: TextStyle(
                    fontFamily: 'GillSansMT',
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ]),
            )),
      )
    );
  }

  Widget selectCard(int card) {
    appbar=false;
    switch (card) {
      case 1:
        return showActionCard();
        break;

      case 6:
        return showEverydayCard();
        break;

      case 23:
        return showNumberCard();
        break;

      case 24:
        return showEveryday2Card(appbar);
        break;

      default:
        return showCard(card);
        break;
    }
  }

  Widget selectCardNotReveled(int card) {

    switch (card) {
      case 1:
        return FlipCard(
          onFlip: () => _sound.playLocal("shuffle.mp3"),
          direction: FlipDirection.VERTICAL, // default
          front: Image.asset('images/cards/0.png'),
          back: showActionCard(),
        );
        break;

      case 6:
        return FlipCard(
          onFlip: () => _sound.playLocal("shuffle.mp3"),
          direction: FlipDirection.VERTICAL, // default
          front: Image.asset('images/cards/0.png'),
          back: showEverydayCard(),
        );
        break;

      case 23:
        return FlipCard(
          onFlip: () => _sound.playLocal("shuffle.mp3"),
          direction: FlipDirection.VERTICAL, // default
          front: Image.asset('images/cards/0.png'),
          back: showNumberCard(),
        );
        break;

      case 24:
        return FlipCard(
          onFlip: () {
            _sound.playLocal("shuffle.mp3");
          },
          direction: FlipDirection.VERTICAL, // default
          front: Image.asset('images/cards/0.png'),
          back: showEveryday2Card(appbar),
        );
        break;

      default:
        return FlipCard(
          onFlip: () => _sound.playLocal("shuffle.mp3"),
          direction: FlipDirection.VERTICAL, // default
          front: Image.asset('images/cards/0.png'),
          back: showCard(card),
        );
        break;
    }
  }

  Widget showCardSet(int number, List<int> card, List<int> randomcard) {
    String image;
    switch (number) {
      case 1:
        {
          image = ((card[0] > 0) ? card[0] : randomcard[0]).toString();
        }
        break;

      case 2:
        {
          image = ((card[1] > 0) ? card[1] : randomcard[1]).toString();
        }
        break;

      case 3:
        {
          image = ((card[2] > 0) ? card[2] : randomcard[2]).toString();
        }
        break;

      default:
        image = "0";
        return SafeArea(
          child: Center(
            child: Image.asset('images/cards/$image.png'),
          ),
        );

        break;
    }

    return selectCard(int.parse(image));
  }

  Widget showCardSetNotFlip(int number, List<int> card, List<int> randomcard) {
    String image;
    switch (number) {
      case 1:
        {
          image = ((card[0] > 0) ? card[0] : randomcard[0]).toString();
        }
        break;

      case 2:
        {
          image = ((card[1] > 0) ? card[1] : randomcard[1]).toString();
        }
        break;

      case 3:
        {
          image = ((card[2] > 0) ? card[2] : randomcard[2]).toString();
        }
        break;
      default:
        image = "0";
        return SafeArea(
          child: Center(
            child: Image.asset('images/cards/$image.png'),
          ),
        );

        break;
    }

    return SafeArea(
      child: Center(
        child: Image.asset('images/cards/$image.png'),
      ),
    );
  }

}
