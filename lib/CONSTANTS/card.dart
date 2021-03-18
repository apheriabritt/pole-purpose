import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';

//i might re enter the card info into a FBDB.
//then get the card widget

class CardWidget {
  final BuildContext context;

  CardWidget(this.context);

  PlaySound _sound = PlaySound();

  ScrollController _controller = ScrollController();

  Widget showActionCard(bool appbar) {
    return Scaffold(extendBodyBehindAppBar: true,
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
      front: Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
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
        ),
      ),
      back: Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Card(
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.black, width: 2),
    borderRadius: BorderRadius.circular(20)),
              color:Colors.white,
                shadowColor: Colors.black,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(thickness:2.0,
                    isAlwaysShown: true,
                    controller: _controller,
                    child: SingleChildScrollView(
                      controller: _controller,

                      child: Column(
                          children: <Widget>[
                        Text('Action & Descriptive Words',style:TextStyle(fontSize: 35,fontFamily: 'Xtreem'),textAlign:TextAlign.center),
                                    SizedBox(height: 10),
                                    Text(
                                      "Action",
                                      textAlign:TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'GillSansMT',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:20,
                                      ),
                                    ),
                                    Text(
                                      "Utilise this card to play with quality of movement.If you always tend to move with smooth and flowing lines, how could you disrupt the flow by thinking about a jagged or sudden dynamic? This could alter something as simple as an arm raise.",
                                      textAlign:TextAlign.left, style: TextStyle(
                                        fontFamily: 'GillSansMT',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(" "),
                                    Text(
                                      "Descriptive Words",
                                      textAlign:TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'GillSansMT',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Rub, sink, rise, melt, bend, stretch, twist, swing, push, pull, rock, balance, shake, float, duck, dodge, jab, poke, shove, carve, freeze, wiggle, turn, fall, straighten, strike, chop, spin, kick, punch, wring, tickle, hug, hang, sway, open, close, flap, pluck, tap, grab, wrap, flick, pose, burst, glide, shrug, dig, blot, flee, chase, dash, hurl, gallop, bounce, rush, sail, plummet, scramble, smash, soar, speed, still, spring, sprint, skip, zoom, whisk, stride, jump, cat walk, shuffle, tip toe, grow, wriggle, polka, waddle, slither, swoon, prance, drag, tense, slow, land, burn, hold, escape, lift, restrict, flight, roll, suspend, collapse, trap, fling, weave, nail, squash, lean, tangle, low, fold, pop, cluster, bind, hop, weld, plant, stack, squeeze, draw out, spread, wedge, fading, shaded, sharp, hard, grotesque, obscure, weak, old, cold, young, flash, shadow, broken, excite, clarify, fragment, reverse, inversion, duration, position, compose, carry, allow, explore, light, heavy, space, shape, break, overlap, dominance, submission, force, follow, resist, ignore, run, repetition, under, behind, reach, lengthen, beyond, inside, outside, explain, mould, add, exaggerate, crawl, merge, absorb, abrupt, rearrange, lines, curves, sudden, jagged, smooth, continuous, even, relax, split, leave and re-enter.",
                                      textAlign:TextAlign.left,style: TextStyle(
                                        fontFamily: 'GillSansMT',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize:20,
                                      ),
                                    ),
            ]),
                    ),
                  ),
                )),
          ),
        ),
      )
    ));
  }
bool appbar=false;
  Widget showEverydayCard() {
    return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front:Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
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
                    Text('Everyday Movement',style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign: TextAlign.center,),
                  ]),
                )),
          ),
        ),
      ),
      back: Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                color:Colors.white,
                shadowColor: Colors.black,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(thickness:2.0,
                    isAlwaysShown: true,
                    controller: _controller,
                    child: ListView(
                        controller: _controller,
                        children: <Widget>[
                      Text('Everyday Movement',style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign:TextAlign.center),
                      SizedBox(height: 10),

                      SizedBox(height: 010,),
                      Text(
                        '''Choose four everyday movements such as waving to somebody or putting clothes on. Write them down and begin to form each idea with your body.   

Try to play with the size and the speed at which you perform the movement as this will really allow you to create something that is not so literal.   

Once you are comfortable with how the movements look and the order in which they are linked together, think about performing them at different points next to or on the pole. How can the pole enhance this movement? Could you try executing these gestures in an invert or in an upright position on the pole?  

Scroll down to see examples for every day movement inspiration, but first try to think of some yourself as it will develop your creative potential.
''',



                        textAlign:TextAlign.left,style: TextStyle(
                          fontFamily: 'GillSansMT',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
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
                                child: new Text("Tap here to see example card for everyday movements inspiration, but first try to think of some yourself as it will develop your creative potential."),
                              ),
                            ),
                          ),

                    ]),
                  ),
                )),
          ),
        ),
      )
    );
  }


  Widget showEveryday2Card(bool appbar) {
    return Scaffold(extendBodyBehindAppBar: true,
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
        front: Center(
          child: Container(
            height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
            child: Padding(
padding: const EdgeInsets.fromLTRB(0,0,0,0),child: Card(
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
        ),
        back:
        Center(
          child: Container(
            height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
            child: Padding(
padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  color:Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Scrollbar(thickness:2.0,
                      isAlwaysShown: true,
                      controller: _controller,
                      child: ListView(
                          controller: _controller,
                          children: <Widget>[
                        Text('Everyday Movements',style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign:TextAlign.center),
                        SizedBox(height: 10),
                        Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                        ),
                        SizedBox(height: 010,),
                        Text(
                          "The Everyday Movements card can be used to expand your imagination from a stylised genre of movement, such as typical pole dance technique, to a more pedestrian style of movement that will offer fruitful ways of enhancing your pole and floor work. \n\nAllow this card to really expand the way you think about movement. Ask yourself what can be considered dance and how you could communicate more effectively by employing some of these everyday gestures.\n\nCheck watch, check e-mail, check current devices, cross and uncross legs, doodle, fiddle (play) with jewellery, sigh, hold breath, talk to self, twirl hair, move hair out of face, crack neck, lean forward, lean back or away, shrug shoulders, roll head, turn head, tilt head, rub neck, touch (drop) chin to chest, bat eyes, roll eyes, wipe off sweat, massage forehead, rub temples, play with beard or moustache, pull (tug) on ear, smooth eyebrows, wink, wipe away tears, choke, tighten, or grip jaw, swallow, put finger to lips (in thought or to shush someone), sip tea or coffee (other drinks), gulp down alcoholic drink, smile, smoke, push hair behind ears, mess with barrettes or ribbons or hats, push hair off face (own face or the face of others), hold someone’s hand, rub hands together, rub hands up and down arms, up and down legs, snap fingers, suck thumb or finger, tap or drum fingers on self or object, toss ball (or other object) hand to hand, trace scars or injuries, shake, or point finger, wrap arms around own body, wring hand, putting on clothes and taking clothes off.",
                          textAlign:TextAlign.left,style: TextStyle(
                            fontFamily: 'GillSansMT',
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),

                      ]),
                    ),
                  )),
            ),
          ),
        )
      ),
    );
  }

  Widget showNumberCard() {
    return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front: Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
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
        ),
      ),
      back: Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
    padding: const EdgeInsets.fromLTRB(0,0,0,0),        child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                color:Colors.white,
                shadowColor: Colors.black,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(thickness:2.0,
                    isAlwaysShown: true,
                    controller: _controller,
                    child: ListView(
                        controller: _controller,
                        children: <Widget>[
                      Text("What's your number?",style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign:TextAlign.center),
                      SizedBox(height: 10),
                      Text(
                        "Using your mobile phone number, and the representations of the numbers below, you are going to create a motif of movement.\n\n0. Balance\n1. Swing\n2. Any Invert\n3. Falling\n4. Roll\n5. Travel\n6. Stillness\n7. Leg movement\n8. Isolation of any body part\n9. Basic spin\n\nIf your number was 07658952145, your motif would be: Balance » leg movement » stillness » isolation » basic spin » travel » any invert » swing » roll » travel.\n\nOnce you have your movement, allow each movement to flow organically from one to the other. What is the most direct route to get there? How close or far away from the pole would you have to be to start? How big or small would your movement have to be in order to get you to that next part of the motif?\n\nThis can be manipulated so there is pole movement only. Change the representation of each number to suit floor movement, pole movement or both. You could also use the action card for some ideas if you get stuck.\n\nTry with your phone number at first, but if you find that your number is too repetitive, it’s ok to change a couple of digits.",
                        textAlign:TextAlign.left,style: TextStyle(
                          fontFamily: 'GillSansMT',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ]),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget showCard(int card) {
   String title;
   String content;
   if(card==0){title='';}
   if(card==1){title='Action & Descriptive Words';content="";}
   if(card==2){title='Animal';content='''Pick an animal and then draw shapes of this animal on a piece of paper. It doesn’t have to look perfect, just clear enough to offer creative impulse. Begin to think of ways that your body can create the iconic stance of this animal whilst recognising the route you need to take to get to that position.   
   
As you go on, consider what body parts are connecting with the floor? How slow or fast does this animal move? Play with the movement quality.  

Maybe you could start away from the pole, allowing the pathway to give you time to evolve into the form of an animal. How would that animal approach the pole? What is the first point of contact? Could the travelling pathway be used as a stimulus to create an innovative way of climbing?''';}
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
   if(card==8){title='Improvisation Freestyle';content='''Before any creative session, take some time to think about the way your body / mind is feeling as this will enable a clearer head and a willingness to create.  
   
As you move into your warm up, focus on your breath as you move. Maybe you could freestyle or go over movement combinations that you already know. If you want to freestyle but tend to freeze up, set some parameters; 

•	Pole work only
•	Floor work only
•	Only move upper or lower body
•	No Standing
•	Only allow two points of contact with the pole.
''';}
   if(card==9){title='Inspiration from Objects';content='''Pick a random object from your bag or from the room you are working and write down 10 ideas about what this object could mean. For instance, if you found a hairbrush, you might think about pampering yourself or pretending you’re a popstar by singing into the brush. Ideas can be totally random and personal to you.  
   
Create movement gestures for each idea, playing with order of movement to see how you can move from one gesture to the other as smoothly as possible.   

Can you repeat any of these gestures on / with the pole? Don’t be afraid to change something to fit the pole. Choreography can be developed as many times as necessary. Maybe you could even see the pole as the object you picked up, how would this dictate the way you move? 

Note: this task is not about dancing with the object, but creating choreography from analysing an object.
''';}
   if(card==10){title='Name Phrase';content='''Using your name as inspiration, draw out each letter of your name with your body. You can use different body parts or you could move the whole of your body at once.  It doesn’t have to be literal and you can create the letters in any shape, size, direction, or style of writing.   
   
When you have a movement for each letter, begin to perform each letter repetitively and notice how your body reacts as you transition from one movement to the next. Is it flowing naturally? 
   
If not, how can you find a clearer route to get from one letter to the next?   If you started this task away from the pole, bring it closer and perform the movement slowly, noticing where your body makes a point of contact with the pole. How could the pole support your weight? Where could you introduce a lift? Think about what you would have to change about your name phrase in order to draw out your name whilst moving on the pole only.''';}
   if(card==11){title='No Floor Contact';content='''Choose your favourite climb to get to the top of the pole. Invert climbs, regular climbs, side climbs. Anything.    
   
Once you are off the ground, your aim is to touch the pole with as many parts of your body as possible without dropping to the floor. If you find yourself slipping to the floor, climb back up a bit. Imagine the floor is water and you can’t swim. You would do whatever you could with your body in order to stay up.   
   
Don’t worry about how it looks for now, just play and experiment. This is great for building up strength / stamina and to find unique ways of moving from one position to another. You could also try this the opposite way around. Moving as closely to the pole as possible, but never quite touching it.''';}
   if(card==12){title='No pole';content='''Start away from the pole in any position you like and begin to think about the pole as something that is disruptive in your space. Consider the following two options.  
   
Accept that the pole is present and find a way to deal with it by navigating your body around / past / with the pole OR you could play with the idea of removing it from the space by tearing it down.  
   
How many different ways can you push / pull the pole and with how many different body parts? What point of the pole would need to most attention?  
   
Once you have experimented and tried different ways, begin to create a phrase by linking the strongest movements together.''';}
   if(card==13){title='Off the Pole';content='''Think of three of your favourite pole tricks and link them together. Practice this combination a few times until it becomes very familiar in your body.  
   
Moving away from the pole, think about how this combination could be replicated on the floor without out the pole? What would you need to change about those specific movements in order to recreate them on the floor? Only use the pole movement as inspiration, it does not have to be an exact replica.  
   
If you get stuck, imagine there is a horizontal pole on the floor. What would you change, if anything, in order to perform those same movements on the floor?   
   
Could you turn this combination in to a phrase that travels?''';}
   if(card==14){title='On and Off';content='''Sit or lie next to the pole and find five ways to get up from the floor using the pole to help you up. Can you spin or invert? Could you lift one leg and only touch the pole with one arm? Are you able to climb with your arms only?  
   
Try this same approach to dismount the pole too. Could you roll off, jump away, slide with your back facing the pole or land into a balance? Play around with where your body could land and experiment with what part of your body comes into contact with the floor.''';}
   if(card==15){title='Playing with Grips';content='''Think about three of your strongest pole grips i.e. elbow grip, back of the knee hook, thigh hold etc. Once you have grips in mind, try moving from one to the next whilst your weight is still on the floor. Even if you are just playing with various hand grips, that is ok.   
   
Play with the speed, size, order and repetition of this.   
   
Once you are comfortable with grips, see where your body wants to move in between each. If you lift your arm to a high point of the pole, where does the rest of your body naturally want to move? How will the pole support your weight? What other body parts meet the pole as a result of this? Does this introduce a new grip?  
   
Now see if you can repeat your three grips whilst you are higher up the pole. What pathway do you have to take in order to move from grip to grip?''';}
   if(card==16){title='Pole as a Person';content='''Imagine you had something to say to someone, something that you needed to get off of your chest. Write this down on a piece of paper.  
   
Begin to see the pole as that person you want to speak to and use your writing to challenge you physically.  
   
If you wanted to tell someone you loved them, think about how this would make you feel when you are around that person. Maybe you would be shy to look at them straight away or maybe you’re confident enough to jump right in and tell them. Play it out with movement, using your words as inspiration.  
   
Keep experimenting with the role of the person (pole) in the space.''';}
   if(card==17){title='Props';content='''Working with a prop of your choice; a hat, a scarf or a microphone. Anything you want.   
   
Think of how you could include it into your pole work so you are not just wearing / holding it? Could you wrap the scarf around the pole, giving you another way to hold on? Could the hat “accidentally” fall off when you are at the top of the pole, giving you an excuse to find a way to the bottom again? Really think about all of the different ways you can make use of your prop.  
   
Alternatively, instead of using the prop to help create movement, you could look at what would happen if you added a prop to one of your existing movement phrases? How would this change the work? Allow change to happen as the original phrase should only act as inspiration for development of a new phrase that includes the prop.''';}
   if(card==18){title='Restricting Freedom';content='''Think about how holding a particular grip or “trick” creates a restriction in a certain part of the body, allowing other areas of the body to move freely. For instance - elbow grip with hanging legs that are running, holding a shoulder mount position as the rest of your body waves or holding a remi sit whilst twisting and turning your upper body.   
   
Go through your favourite tricks on the pole and really think about what part of your body is isolated for the grip and what parts of the body are free to move. You’ll be surprised at how much you can develop one trick by doing this.   
''';}
   if(card==19){title='Sell it';content='''Imagine the pole is a product that you want to sell. What would you do to show it off? How would you showcase the versatility of it?

Imagine you could zap it up in any location and really think about the different ways in which it might be useful in this environment. For instance, if it was outside, could it be used as a wall to lean on? Or if it was inside could it be used as a ladder to reach something?

Maybe you will see it as an object – a sort of safety net that you could hide behind? What if the pole was a form of defence, a weapon, an instrument to tease, or a barrier that blocks others from passing into your direction?

Explore the possibilities, write down your ideas and test them out.
''';}
   if(card==20){title='The Pole is your Audience';content='''Use one of your existing off pole phrases of movement and forget about the front being the front and the back being the back. The pole represents the front and back of your space. It is your only audience.  
   
Perform your phrase taking into consideration how close or far away you would want to be from your audience (the pole). Would you want to dance with them? Would you want to look at them? Would you want your back to them? If you did come really close, how would you engage with the pole as a result of the movement you just did? Think about the pathway again.   
   
Really play around with all of the phrases you have built up and see how different your movement looks in a different point in the space whilst focusing on the pole as your main direction.''';}
   if(card==21){title='Timing is Everything';content='''Using the action cards for inspiration, interpret six of the words with your body and generate a short phrase of movement. If you want to make it longer you can add more words or use repetition.

As you are putting this phrase together, remember that you don’t just have to walk on the floor; you can walk on the pole, drop from the top to the bottom of the pole, kick your leg whilst you are on the pole etc.

Once you have linked movements together and are comfortable with the order, begin to play with timing. Slow everything down as if you wanted to see it in extreme slow motion. Alternatively, you could then speed it up so it is like a time lapse.

Think about how the pace is enhancing each movement. You can repeat this task over and over with different words or introducing rules about timing; first two moves have to be slow, third is fast, fourth is slow and fifth and sixth is average speed. Trial and error.
''';}
   if(card==22){title='Visual Art';content='''Think of a piece of visual art work that you enjoy, such as a painting or a picture. Once you have a clear image of it, begin to write about it in great detail; how does it make you feel? Does it remind you of something, someone or somewhere?

Create an individual dance sequence in response to the themes that have emerged from your writing. Perhaps the artwork makes you feel happy. How would happiness be portrayed in movement?

Alternatively, or in addition to, you could focus on using the lines and shapes as a stimulus for your movement patterns. Are they sharp or repetitive? Could the colour of the work dictate how fast or slow you perform the movement?

This task can be carried out on or off the pole, either way, be sure to give the pole a purpose within the art work; a specific role to play. You don’t necessarily have to climb it, you could just be moving around it, side to side, back and forth, up and down. Test what works for you.
''';}
   if(card==23){title="What's your number?";content="";}
   if(card==24){title='Everyday Movements';content="";}

   return FlipCard(
      onFlip: () => _sound.playLocal("shuffle.mp3"),
      direction: FlipDirection.HORIZONTAL, // default
      front: Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
padding: const EdgeInsets.fromLTRB(0,0,0,0),child: Card(
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
        ),
      ),

      back: Center(
        child: Container(
          height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                color:Colors.white,
                shadowColor: Colors.black,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(thickness:2.0,
                    isAlwaysShown: true,
                    controller: _controller,
                    child: ListView(
                        controller: _controller,
                        children: <Widget>[
                      Text(title,style:TextStyle(fontSize:35,fontFamily: 'Xtreem'),textAlign:TextAlign.center),
                      SizedBox(height: 10),
                      Text(
                        content,
                        textAlign:TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'GillSansMT',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                          card!=18?Container():SizedBox(height:10),
                          card!=18?Container():
                           GestureDetector(
                            onTap: () {
                              appbar=true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => showActionCard(appbar)),
                              );
                            },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child:Text('Use the "Action" Card if you need inspiration for initiating further movement in "free" areas of the body.')
                              ),
                            ),
                          ),
                          card!=18?Container():SizedBox(height:10),
                        ]),
                  ),
                )),
          ),
        ),
      )
    );
  }

  Widget selectCard(int card) {
    appbar=false;
    switch (card) {
      case 1:
        return showActionCard(appbar);
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
          front:

          Center(
              child: Container(
                height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        color:Colors.white,
                        shadowColor: Colors.black,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
              child: Image.asset('images/cards/0.png',height:MediaQuery.of(context).size.width/1.2)))))),
          back: showActionCard(appbar),
        );
        break;

      case 6:
        return FlipCard(
          onFlip: () => _sound.playLocal("shuffle.mp3"),
          direction: FlipDirection.VERTICAL, // default
          front:  Center(
              child: Container(
                  height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          color:Colors.white,
                          shadowColor: Colors.black,
                          elevation: 5.0,
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('images/cards/0.png',height:MediaQuery.of(context).size.width/1.2)))))),
          back: showEverydayCard(),
        );
        break;

      case 23:
        return FlipCard(
          onFlip: () => _sound.playLocal("shuffle.mp3"),
          direction: FlipDirection.VERTICAL, // default
          front:  Center(
              child: Container(
                  height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          color:Colors.white,
                          shadowColor: Colors.black,
                          elevation: 5.0,
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('images/cards/0.png',height:MediaQuery.of(context).size.width/1.2)))))),
          back: showNumberCard(),
        );
        break;

      case 24:
        return FlipCard(
          onFlip: () {
            _sound.playLocal("shuffle.mp3");
          },
          direction: FlipDirection.VERTICAL, // default
          front:  Center(
              child: Container(
                  height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          color:Colors.white,
                          shadowColor: Colors.black,
                          elevation: 5.0,
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('images/cards/0.png',height:MediaQuery.of(context).size.width/1.2)))))),
          back: showEveryday2Card(appbar),
        );
        break;

      default:
        return FlipCard(
          onFlip: () => _sound.playLocal("shuffle.mp3"),
          direction: FlipDirection.VERTICAL, // default
          front:  Center(
              child: Container(
                  height:MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.2,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          color:Colors.white,
                          shadowColor: Colors.black,
                          elevation: 5.0,
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('images/cards/0.png',height:MediaQuery.of(context).size.width/1.2)))))),
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
            child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset('images/cards/$image.png')),
          ),
        );

        break;
    }

    return SafeArea(
      child: Center(
        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.asset('images/cards/$image.png'),
            )),
      ),
    );
  }

}

String title1 = 'title 1';