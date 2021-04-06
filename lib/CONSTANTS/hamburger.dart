import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/ADMIN/cardHome.dart';
import 'package:pole_purpose/AUTH/services.dart';
import 'package:pole_purpose/AUTH/wrapper.dart';
import 'package:pole_purpose/BLOG/blog.dart';
import 'package:pole_purpose/BROWSE%20CARDS/BrowseCards.dart';
import 'package:pole_purpose/MORE%20INFO/about.dart';
import 'package:pole_purpose/MORE%20INFO/author.dart';
import 'package:pole_purpose/MORE%20INFO/copyright.dart';
import 'package:pole_purpose/MORE%20INFO/privacy.dart';
import 'package:pole_purpose/MORE%20INFO/terms.dart';
import 'package:pole_purpose/ONLINE%20CLASSES/OnlineClasses.dart';
import 'package:pole_purpose/ADMIN/PUSHHUB.dart';


var hamburger = PreferredSize(
      // IconButton(icon:Icon(Icons.vpn_key),color:Colors.black.withOpacity(0.1),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PushHub(),));}),
    preferredSize: const Size.fromHeight(200.0),
     child: StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {

      AnimationController animateController;
Future.delayed(const Duration(seconds: 3), () {
animateController.stop();});
      void help(){
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 500,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Instructions',textAlign: TextAlign.center,style:TextStyle(fontSize:30)),
                      ),
        Text('''
Long press on card: zoom in on card'''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Intro',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      ),
                      Text('''                                     
The tasks within this app are really easy to follow. Read the text on each card and think about what the card is instructing you to do. Each task can be used over and over again and will often result in a very different outcome. 

If you are new to dance making, spend some time on your own at the studio or at home if you have your own pole. This way, you can really hone in on what it is you enjoy exploring through your body. Use the notes page to record the tasks you found most effective and the ones that were least effective. If you did find some tasks more stimulating, why? If you found other tasks less exciting, why? People learn and create in many different ways, so it is important that you follow the path that inspires you to move your body with complete enthusiasm. 
                      '''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Further Info',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      ),
                      Text('''
If you have found yourself becoming intrigued by a certain subject or theme and want to develop it further, begin to ask yourself the following questions: 

Where did it come from? 

Who does it belong to? 

Where else might you find this? 

What does it make you think of and how does it make you feel? 

Gather information through mind mapping, researching your idea on the internet or at the library, and also, discussion with others. Their response, even if it is the complete opposite of yours, is useful for perspective. 

Once you know more about the subject, begin to use the cards as a means to create the movement you envision. 

What movements represent and symbolise the message you want to communicate? 

What type of mood and atmosphere might compliment this? 
                      '''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Choreo Tips',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      ),
                      Text('''
As you move through your explorations, allow the presence of the pole to impact how you perform all movement by considering what your connection is to the pole? Have you given the pole a purpose in the space? What is your relationship about? Do you make any sort of nonphysical contact with it? Such as a look or a reach. All movement created off the pole can be applied to the pole, even in the most minuscule way. A repeated hand gesture or the turn of the head. You are not limited to the tricks you know on the pole so be sure to really experiment. 

Overall, it is key to remember that there are tried and tested ways to create dance, like the tasks offered in these cards, but in order to continually evolve your own process and to develop your own ideas, you could go completely against what exists and still create great dance. Choreography is a process and there is no right or wrong way to create movement; what you create should always be individual to you. Use these cards for inspiration and be excited about the choreographer you are becoming. 
                      '''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Develop Movement',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      ),
                      Text('''
How can you travel something that was static before? Add a step, a roll, a run or a jump. 

What would your phrase look like in retrograde? This means rewinding the movement and performing it backwards. Ending where you started. 

What happens if you set some boundaries – performing the movement at a low, medium or high level? What would happen if you make the space smaller or bigger? 

The use of music can act as a practical tool for testing how you might adapt performance quality / style. 

Choose two completely different tracks to perform your movement to. Try something really sad or intense, such as “Dyad” by Olafur Arnolds and then move onto something more fun such as “Like a Virgin” by Madonna. 

Imagine that your audience was in several different viewpoints. For instance, you might have someone viewing your movement from the top of the pole, the side, front and back. What would you have to do differently in order to keep everyone engaged? Would your movement have to be bigger? What would you add / take away? 
                      '''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Glossary',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      ),
                      Text('''

Pole Tricks 

Set technical movements that are performed on the pole.   

Repetition 

Duplication of a movement or movements phrases within dance choreography. 

Retrograde 

To reverse the order of a sequence of dance choreography. 

Stimulus 

Inspiration from something that encourage movement based on goals and ideas. 

Space 

The area in and through which dance moves. 

Theme 

Unifying or dominant idea in a movement pattern, sequence, or dance from which variations may be developed.  

Transition 

When a movement, phrase, or section of a dance progresses into the next. 

Travel 

Move from one point in space to another. Typically, a long stretch. 
                      '''),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Safety',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      ),
                      Text('''
Please note that Pole Purpose is not liable for any injuries that may occur as a result of unsafe practice. It is your duty to recognise the importance of warming up and cooling down, before and after all creative dance activity. If you are working with more than one pole, please consider spacial awareness by becoming familiar with the space before you begin. Tidy away technical equipment and wear the correct attire for pole dance practice. Consider your level of ability and current fitness level. Building up dance phrases can be very different to what you’re used to in a typical pole dancing class where you only learn tricks. If you are trying a new pole combination for the first time, and are not entirely confident, please ensure that you have safety mats or that someone else is present with you in the studio to “spot” you. Please note that, for safety reasons, unless stated otherwise, all exercises will start from a floor based task and then be transferred to the pole. 
                      '''),



                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
void showModal(){
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 500,
        child: Center(
          child: ListView(
            children: <Widget>[
              TextButton(
                  child:ListTile(
                      leading:Image.asset('images/assets/ICONS/home90.png',color:Colors.black,width:35),
                      title: Text('HOME',style:TextStyle(color:Colors.black,fontSize:35))
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowseCards()));
                  }
              ),
              TextButton(
                onPressed:null,
                child:ExpansionTile(
                    leading:Image.asset('images/assets/ICONS/help.png',color:Colors.black,width:35),
                    title: Text('INFO',style:TextStyle(color:Colors.black,fontSize:35)),
                  children:[
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Author(),
                            ));
                      },
                      child: ListTile(
                          title: Text('AUTHOR')
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => About(),
                            ));
                      },
                      child: ListTile(
                          title: Text('ABOUT')
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Copyright(),
                            ));
                      },
                      child: ListTile(
                          title: Text('COPYRIGHT')
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Privacy(),
                            ));
                      },
                      child: ListTile(
                          title: Text('PRIVACY')
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Terms(),
                            ));
                      },
                      child: ListTile(
                          title: Text('TERMS')
                      ),
                    ),
                  ]
                ),
              ),
              TextButton(
                child:ListTile(
                    leading:Image.asset('images/assets/ICONS/classroom.png',color:Colors.black,width:35),
                    title: Text('ONLINE CLASSES',style:TextStyle(color:Colors.black,fontSize:35))
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnlineClasses(),
                    ),
                  );
                },
              ),
              TextButton(
                child:ListTile(
                    leading:Image.asset('images/assets/ICONS/typewriter.png',color:Colors.black,width:35),
                    title: Text('BLOG',style:TextStyle(color:Colors.black,fontSize:35))
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Blog(),
                    ),
                  );
                },
              ),
              TextButton(
                child:ListTile(
                    leading:Icon(Icons.logout,color:Colors.black,size:35),
                    title: Text('SIGN OUT',style:TextStyle(color:Colors.black,fontSize:35))
                ),
                onPressed: ()
                  async {
                    final AuthService _auth = AuthService();
                    await _auth.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                    );
                },
              ),
              TextButton(
                child:ListTile(
                    leading:Icon(Icons.notifications_active,color:Colors.black,size:35),
                    title: Text('PUSH HUB',style:TextStyle(color:Colors.black,fontSize:35))
                ),
                onPressed: ()
                async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PushCentre()),
                  );
                },
              ),
              TextButton(
                child:ListTile(
                    leading:Icon(Icons.add,color:Colors.black,size:35),
                    title: Text('UPLOAD CARDS',style:TextStyle(color:Colors.black,fontSize:35))
                ),
                onPressed: ()
                async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewPPCards()),
                  );
                },
              )
            ],
          ),
        ),
      );
    },
  );
    }
          return
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[ Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 15, 0),
                  child: Pulse(
                    controller: ( controller ) => animateController = controller,
                    infinite: true,
                    child: FloatingActionButton(
                      elevation: 0.0,
                      heroTag: 'help',
                        backgroundColor: Colors.transparent,
                        child:Image.asset('images/assets/ICONS/help.png',fit:BoxFit.fill),
                        onPressed: help
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 25, 0),
                  child: FloatingActionButton(
                    heroTag: 'menu',
                      backgroundColor: Colors.white,
                      child:Icon(Icons.menu,color:Colors.black,size:35),onPressed: showModal
          ),
                )],
              ),
            );}),

);