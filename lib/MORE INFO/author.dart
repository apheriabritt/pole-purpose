import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';
import 'package:url_launcher/url_launcher.dart';

class Author extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: hamburger,
      body: Material(
          color: Colors.white,
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'images/pageimages/author.png',
                      fit: BoxFit.fill,
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
    );
  }
}