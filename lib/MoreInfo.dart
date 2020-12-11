import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pole_purpose/MoreInfoPages/author.dart';
import 'package:pole_purpose/MoreInfoPages/about.dart';
import 'package:pole_purpose/MoreInfoPages/privacy.dart';
import 'package:pole_purpose/MoreInfoPages/blog.dart';
import 'package:pole_purpose/MoreInfoPages/copyright.dart';
import 'package:pole_purpose/MoreInfoPages/terms.dart';
import 'MoreInfoPages/OnlineClasses.dart';
import 'widget/menuButton.dart';

class MoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
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
        middle: const Text('More Info',
            style: TextStyle(
                fontFamily: 'GillSansMT',
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MenuButtonWidget(context).menuButton(
                    "AUTHOR",
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Author(),
                        ),
                      )
                    }),
                MenuButtonWidget(context).menuButton(
                    "ABOUT",
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => About(),
                        ),
                      )
                    }),
                MenuButtonWidget(context).menuButton(
                    "BLOG",
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Blog(),
                        ),
                      )
                    }),
                MenuButtonWidget(context).menuButton(
                    "ONLINE CLASSES",
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnlineClasses(),
                        ),
                      )
                    }),
                MenuButtonWidget(context).menuButton(
                    "PRIVACY",
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Privacy(),
                        ),
                      )
                    }),
                MenuButtonWidget(context).menuButton(
                    "TERMS",
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Terms(),
                        ),
                      )
                    }),
                MenuButtonWidget(context).menuButton(
                    "COPYRIGHT",
                        () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Copyright(),
                        ),
                      )
                    }),
              ]),
        ),
      ),
    );
  }
}
