import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: hamburger,
      body: Material(
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