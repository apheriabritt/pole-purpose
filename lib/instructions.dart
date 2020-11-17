import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/instructionpages/futherinfo.dart';
import 'instructionpages/intro.dart';
import 'instructionpages/futherinfo.dart';
import 'instructionpages/choreotips.dart';
import 'instructionpages/developmovement.dart';
import 'instructionpages/glossary.dart';
import 'instructionpages/safety.dart';
import 'widget/menuButton.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
           leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
          middle: const Text('Instructions', 
          style: TextStyle(
              fontFamily: 'GillSansMT', fontWeight: FontWeight.bold, fontSize: 18 
            ),
            ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                  MenuButtonWidget(context).menuButton(
                  "INTRO", 
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Intro(),
                      ),
                    )
                  }
                ),
                MenuButtonWidget(context).menuButton(
                  "FURTHER INFO", 
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FurtherInfo(),
                      ),
                    )
                  }
                ),
                MenuButtonWidget(context).menuButton(
                  "CHOREO TIPS", 
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChoreoTips(),
                      ),
                    )
                  }
                ),
                MenuButtonWidget(context).menuButton(
                  "DEVELOP MOVEMENT", 
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DevelopMovement(),
                      ),
                    )
                  }
                ),
                MenuButtonWidget(context).menuButton(
                  "GLOSSARY", 
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Glossary(),
                      ),
                    )
                  }
                ),
                MenuButtonWidget(context).menuButton(
                  "SAFETY", 
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Safety(),
                      ),
                    )
                  }
                ),
              ]
            ),
          ),
        ),
    );
  }
}
