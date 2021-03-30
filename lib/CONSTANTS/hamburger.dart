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
                      Text('Instructions',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      Text('Intro',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      Text('Further Info',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      Text('Choreo Tips',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      Text('Develop Movement',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      Text('Glossary',textAlign: TextAlign.center,style:TextStyle(fontSize:25)),
                      Text('Safety',textAlign: TextAlign.center,style:TextStyle(fontSize:25))



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
                      leading:Icon(Icons.home,color:Colors.black,size:35),
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
                    leading:Icon(Icons.help,color:Colors.black,size:35),
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
                    leading:Icon(Icons.home,color:Colors.black,size:35),
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
                    leading:Icon(Icons.post_add,color:Colors.black,size:35),
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
                  child: FloatingActionButton(
                    heroTag: 'help',
                      backgroundColor: Colors.black,
                      child:Text('?',style:TextStyle(fontSize:30)),onPressed: help
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