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
      front: Padding(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Image.asset('images/cards/1.png',height:MediaQuery.of(context).size.height/2),
                //image
                Text('Action & Descriptive Words',style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign: TextAlign.center,),
              ]),
            )),
      ),
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
                Text('Action & Descriptive Words',style:TextStyle(fontSize: 35,fontFamily: 'Xtreem')),
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
      front:Padding(
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/cards/6.png',height:MediaQuery.of(context).size.height/2),
                    //image
                Text('Everyday Movements',style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign: TextAlign.center,),
              ]),
            )),
      ),
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
                Text('Everyday Movements',style:TextStyle(fontSize:35,fontFamily: 'Xtreem')),
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
                  'content',
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
          width:MediaQuery.of(context).size.width,
          child: Padding(
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/cards/24.png',height:MediaQuery.of(context).size.height/2),
                        //image
                    Text('Everyday Movements',style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign: TextAlign.center,),
                  ]),
                )),
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
                  Text('Everyday Movements',style:TextStyle(fontSize:35,fontFamily: 'Xtreem')),
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
      front: Padding(
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/cards/23.png',height:MediaQuery.of(context).size.height/2),
                    //image
                Text("What's your number?",style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign: TextAlign.center,),
              ]),
            )),
      ),
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
                Text("What's your number?",style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),),
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
   String title;
   String content;
   if(card==0){title='';}
   if(card==1){title='Action & Descriptive Words';content="";}
   if(card==2){title='Animal';content="Pick an animal and then draw shapes of this animal on a piece of paper. It doesn’t have to look perfect, just clear enough to offer creative impulse. Begin to think of ways that your body can create the iconic stance of this animal whilst recognising the route you need to take to get to that position.   As you go on, consider what body parts are connecting with the floor? How slow or fast does this animal move? Play with the movement quality.  Maybe you could start away from the pole, allowing the pathway to give you time to evolve into the form of an animal. How would that animal approach the pole? What is the first point of contact? Could the travelling pathway be used as a stimulus to create an innovative way of climbing?";}
   if(card==3){title='Close Your Eyes';content='''Begin standing or seated anywhere in the space. Close your eyes and start to draw attention to some of the pathways you would usually take to reach pole. Repeat them, but really feel every moment. 
   
   Feeling and not seeing the movement will bring new intention to the way you approach the pole in future. Also, it will raise awareness of habitual movement. You can then challenge them by moving with an opposing quality and or aesthetic.
  
   Tip: if you find it difficult to keep your eyes closed, wear a blindfold.
    ''';}
   if(card==4){title='Combining Movement Phases';content='''To combine floor movement and pole movement with ease, you should practice transitions.  
   To do this you will need at least two phrases of movement, either on the pole, off the pole or both. Perform each phrase, moving from the first to the second straight away, as smoothly as possible.  
   Think about direct and indirect pathways. What is the most obvious way to get there? What is the least obvious way? Try both until the two sections are linked seamlessly.   
   Also, don’t be afraid to use minimal movement such as walking, running, falling, climbing, inverting etc.''';}
   if(card==5){title='Create Your Own Task';content="When creating your own task, the idea can be drawn from completely new concept or it could be a prompt you were once working on with somebody else. Scribble a few ideas down and select the idea that stands out the most. As time passes, you will bring clarity and intention to your task. See this as a task within a task that infinitely develops your idea muscle.";}
   if(card==6){title='Everyday Movements';content="";}
   if(card==7){title='Exaggerating Emotion';content='''Write down six basic movements, preferably a combination of pole and floor movement. Choose from the action cards for more inspiration.   
   
   Using words to stimulate action, put movements together and practice a couple of times to find a natural flow.    
   
   Think about changing the intention of your movement to two other emotional states; happy / sad, excited / overwhelmed or hungover / energetic. Pay attention to how the emphasis of change in mood affect your quality of movement. Try it a few times over and really exaggerate every step.''';}
   if(card==8){title='Improvisation Freestyle';content="";}
   if(card==9){title='Inspiration from Objects';content="";}
   if(card==10){title='Name Phrase';content="";}
   if(card==11){title='No Floor Contact';content="";}
   if(card==12){title='No pole';content="";}
   if(card==13){title='Off the Pole';content="";}
   if(card==14){title='On and Off';content="";}
   if(card==15){title='Playing with Grips';content="";}
   if(card==16){title='Pole as a Person';content="";}
   if(card==17){title='Props';content="";}
   if(card==18){title='Restricting Freedom';content="";}
   if(card==19){title='Sell it';content="";}
   if(card==20){title='The Pole is your Audience';content="";}
   if(card==21){title='Timing is Everything';content="";}
   if(card==22){title='Visual Art';content="";}
   if(card==23){title="What's your number?";content="";}
   if(card==24){title='Everyday Movements';content="";}

   return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front: Padding(
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    //image
                    Image.asset('images/cards/$card.png',height:MediaQuery.of(context).size.height/2),
                    Text('$title',style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign: TextAlign.center,),
                  ]),
                )),
          ),

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
                Text(title,style:TextStyle(fontSize:35,fontFamily: 'Xtreem')),
                SizedBox(height: 10),
                Text(
                  content,
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

String title1 = 'title 1';