import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Online Classes',
          style: TextStyle(
              fontFamily: 'GillSansMT',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
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
      child: Material(
        color: Colors.white,
        child: Stack(
          children: [

            /// background image
            Container(
              child: SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                        'images/pageimages/online-classes.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top :50.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height * 0.30,
                            // width: MediaQuery.of(context).size.width * 0.70,
                            height: 140,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top : 5.5),
                                child: GestureDetector(
                                    onTap: () async {
                                      const url = 'https://www.polepurpose.com/online-classes/';

                                      if (await canLaunch(url)) {
                                        await launch(url, forceWebView: true);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    child: Text("ONLINE CLASSES", textAlign: TextAlign.center,style:TextStyle(fontFamily: 'GillSansMT', color: Colors.black, fontSize: 56))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top : 10.0),
                              child: GestureDetector(
                                  onTap: () async {
                                    const url = 'https://www.polepurpose.com/online-classes/';

                                    if (await canLaunch(url)) {
                                      await launch(url, forceWebView: true);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Text("https://www.polepurpose.com/online-classes/", textAlign: TextAlign.center,style:TextStyle(fontFamily: 'GillSansMT', color: Color(0xffe1163c), fontSize: 13))),
                            ),
                          ),
                        ],
                      ),

                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}