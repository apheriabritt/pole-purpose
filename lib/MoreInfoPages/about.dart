import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                    ''',textAlign: TextAlign.center,),
                    GestureDetector(
                      onTap:(){
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return
                                CupertinoPageScaffold(
                                    backgroundColor: Colors.white,
                                    navigationBar: CupertinoNavigationBar(
                                        actionsForegroundColor: Colors.black,
                                        middle:  Text('Rowena Gander'
                                        )),
                                    child: Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: WebView(
                                            initialUrl: 'https://rowenagander.com',
                                            javascriptMode: JavascriptMode.unrestricted,
                                          ),
                                        ))
                                );
                              ////////////////////
                            }));
                      }, //push to new page
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        color:Colors.white,
                        shadowColor: Colors.black,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text('Author: Rowena Gander'),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      //push to new page
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        color:Colors.white,
                        shadowColor: Colors.black,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Artwork: Ekaterina Filipchenko'),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return
                                CupertinoPageScaffold(
                                    backgroundColor: Colors.white,
                                    navigationBar: CupertinoNavigationBar(
                                        actionsForegroundColor: Colors.black,
                                        middle:  Text('Clare Bonthrone'
                                        )),
                                    child: Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: WebView(
                                            initialUrl: 'https://bonoptix.co',
                                            javascriptMode: JavascriptMode.unrestricted,
                                          ),
                                        ))
                                );
                              ////////////////////
                            }));
                      }, //push to new page
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        color:Colors.white,
                        shadowColor: Colors.black,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Design: Clare Bonthrone'),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return
                                CupertinoPageScaffold(
                                    backgroundColor: Colors.white,
                                    navigationBar: CupertinoNavigationBar(
                                        actionsForegroundColor: Colors.black,
                                        middle:  Text('Lucas Nicolou'
                                        )),
                                    child: Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: WebView(
                                            initialUrl: 'https://lcsvcn.github.io',
                                            javascriptMode: JavascriptMode.unrestricted,
                                          ),
                                        ))
                                );
                              ////////////////////
                            }));
                      }, //push to new page
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        color:Colors.white,
                        shadowColor: Colors.black,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Developer: Lucas Nicolou'),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return
                                CupertinoPageScaffold(
                                    backgroundColor: Colors.white,
                                    navigationBar: CupertinoNavigationBar(
                                        actionsForegroundColor: Colors.black,
                                        middle:  Text('Britt Wood'
                                        )),
                                    child: Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: WebView(
                                            initialUrl: 'https://linkedin.com/in/apheriabritt',
                                            javascriptMode: JavascriptMode.unrestricted,
                                          ),
                                        ))
                                );
                              ////////////////////
                            }));
                      }, //push to new page
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        color:Colors.white,
                        shadowColor: Colors.black,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('Developer: Britt Wood'),
                          ),
                        ),
                      ),
                    ),
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
                    ]
                ),
              ),
            ),
          ),
        ),
    );
  }
}