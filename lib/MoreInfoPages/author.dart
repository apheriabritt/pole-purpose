import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Author extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          
          middle: const Text('Author',
            style: TextStyle(
              fontFamily: 'GillSansMT', fontWeight: FontWeight.bold, fontSize: 18 
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