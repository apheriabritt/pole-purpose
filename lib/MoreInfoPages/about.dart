import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          middle: const Text('About',
            style: TextStyle(
              fontFamily: 'GillSansMT',  
              fontWeight: FontWeight.bold, 
              fontSize: 18
            ),
          ),
           leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),

        ),
        child: Material(
          color: Colors.white,
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    Image.asset('images/polepurposelogo.png'),
                    Text('''
                    
Founded in 2015 by Rowena Gander, Pole Purpose provides easy to follow tools that encourage creativity in pole dance. To ensure full accessibility, all methods have been tried and tested by pole dancers at advanced, beginner and professional levels. Our ultimate goal is for you to find your inner choreographer and to empower your creative practice so that you can speak through movement.

Author: Rowena Gander

Artwork: Ekaterina Filipchenko

Design: Clare Bonthrone

Developers: Lucas Nicolou, Britt Wood
                    ''',textAlign: TextAlign.center,),
                    Padding(
                      padding: EdgeInsets.symmetric(),
                      child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent, // makes hig
                        color: Colors.white,
                        child: Text(
                          'www.polepurpose.com',
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'GillSansMT',
                            fontSize: (MediaQuery.of(context).size.height > 900) ? 30 : 15,
                            decoration: TextDecoration.underline,
                            color: Color(0xffe1163c),
                          ),

                        ),
                      onPressed: () => launch('https://www.polepurpose.com/')
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: FlatButton(
                        color: Colors.white,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent, // makes hig
                        child: Text(
                          'www.rowenagander.com',
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            fontFamily: 'GillSansMT',
                            fontSize: (MediaQuery.of(context).size.height > 900) ? 30 : 15,
                            decoration: TextDecoration.underline,
                            color: Color(0xffe1163c),
                          ),

                        ),
                        onPressed: () => launch('http://www.rowenagander.com/')
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}