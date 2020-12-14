import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/BrowseCards.dart';
import 'package:pole_purpose/MoreInfo.dart';
import 'package:pole_purpose/Start.dart';
import 'BrowseCards.dart';
import 'notebookMain.dart';
import 'savedSetsMain.dart';
import 'widget/menuButton.dart';
import 'package:pole_purpose/instructions.dart';
import 'package:pole_purpose/MoreInfoPages/blog.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white, 
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Menu',
           style: TextStyle(fontFamily: 'GillSansMT', fontWeight: FontWeight.bold, fontSize: 18)
        ),
        
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MenuButtonWidget(context).menuButton(
                "START", 
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Start(),
                    ),
                  )
                }
              ),
              MenuButtonWidget(context).menuButton(
                'BROWSE CARDS',
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BrowseCards(),
                    ),
                  )
                }
              ),
              MenuButtonWidget(context).menuButton(
                'SAVED SETS',
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedSetsMain(),
                    ),
                  )
                }
              ),
              MenuButtonWidget(context).menuButton(
                'NOTES',
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notes(),
                    ),
                  )
                }
              ),
               MenuButtonWidget(context).menuButton(
                'INSTRUCTIONS',
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Instructions(),
                    ),
                  )
                }
              ),
              MenuButtonWidget(context).menuButton(
                'MORE INFO',
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreInfo(),
                    ),
                  )
                }
              ),
              MenuButtonWidget(context).menuButton(
                  'BLOG',
                      () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Blog(),
                      ),
                    )
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
