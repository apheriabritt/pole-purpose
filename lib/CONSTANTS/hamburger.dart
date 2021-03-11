import 'package:flutter/material.dart';
import 'package:pole_purpose/BROWSE%20CARDS/BrowseCards.dart';
import 'package:pole_purpose/CARD%20MIX/3CardMix.dart';
import 'package:pole_purpose/INSTRUCTIONS/choreotips.dart';
import 'package:pole_purpose/INSTRUCTIONS/developmovement.dart';
import 'package:pole_purpose/INSTRUCTIONS/futherinfo.dart';
import 'package:pole_purpose/INSTRUCTIONS/glossary.dart';
import 'package:pole_purpose/INSTRUCTIONS/intro.dart';
import 'package:pole_purpose/INSTRUCTIONS/safety.dart';
import 'package:pole_purpose/MORE%20INFO/about.dart';
import 'package:pole_purpose/MORE%20INFO/author.dart';
import 'package:pole_purpose/MORE%20INFO/blog.dart';
import 'package:pole_purpose/MORE%20INFO/copyright.dart';
import 'package:pole_purpose/MORE%20INFO/privacy.dart';
import 'package:pole_purpose/MORE%20INFO/terms.dart';
import 'package:pole_purpose/MoreInfo.dart';
import 'package:pole_purpose/NOTES/notebook.dart';
import 'package:pole_purpose/ONLINE%20CLASSES/OnlineClasses.dart';


var hamburger = AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    actions:[
      // IconButton(icon:Icon(Icons.vpn_key),color:Colors.black.withOpacity(0.1),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PushHub(),));}),
      StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
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
                child:ListTile(
                    leading:Icon(Icons.home,color:Colors.black,size:35),
                    title: Text('CARD MIX',style:TextStyle(color:Colors.black,fontSize:35))
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardMix(-1, -1, -1, -1)));
                },
              ),
              TextButton(
                child:ListTile(
                    leading:Icon(Icons.home,color:Colors.black,size:35),
                    title: Text('NOTES',style:TextStyle(color:Colors.black,fontSize:35))
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notebook(),
                    ),
                  );
                },
              ),
              TextButton(
                onPressed:null,
                child:ExpansionTile(
                    leading:Icon(Icons.home,color:Colors.black,size:35),
                    title: Text('INSTRUCTIONS',style:TextStyle(color:Colors.black,fontSize:35)),
                    children:[
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Intro(),
                              ));
                        },
                        child: ListTile(
                            title: Text('INTRO')
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FurtherInfo(),
                              ));
                        },
                        child: ListTile(
                          title: Text('FURTHER INFO')
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChoreoTips(),
                              ));
                        },
                        child: ListTile(
                            title: Text('CHOREO TIPS')
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DevelopMovement(),
                              ));
                        },
                        child: ListTile(
                            title: Text('DEVELOP MOVEMENT')
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Glossary(),
                              ));
                        },
                        child: ListTile(
                            title: Text('GLOSSARY')
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => Safety(),
                        ));
                        },
                        child: ListTile(
                            title: Text('SAFETY')
                        ),
                      )
                    ]
                ),

              ),
              TextButton(
                onPressed:null,
                child:ExpansionTile(
                    leading:Icon(Icons.home,color:Colors.black,size:35),
                    title: Text('MORE INFO',style:TextStyle(color:Colors.black,fontSize:35)),
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
                              builder: (context) => Blog(),
                            ));
                      },
                      child: ListTile(
                          title: Text('BLOG')
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
                    leading:Icon(Icons.home,color:Colors.black,size:35),
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
              )
            ],
          ),
        ),
      );
    },
  );
    }
          return IconButton(icon:Icon(Icons.menu,color:Colors.black,size:35),onPressed: showModal,);}),
      Container(width:25)
    ]
);