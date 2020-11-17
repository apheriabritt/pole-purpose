import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/PickACard.dart';
import '../services/savedInstructions.dart';

class Intructions extends StatefulWidget {
  @override
  _IntructionsState createState() => _IntructionsState();
}

class _IntructionsState extends State<Intructions> {
  bool hideInstructions = false;
  SavedInstructions prefs = SavedInstructions();

  changeState() {
    setState(() {
      hideInstructions = !hideInstructions;
    });
  }


  gotoPickACard() {
    prefs.setShowInstructions(!hideInstructions);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PickACard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          middle: const Text('How to Use',
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
                    flex: 1,
                    child: Image.asset(
                      'images/pageimages/instructions.png',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height > 700) ? 10 : 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        Checkbox(
                          value: hideInstructions,
                          onChanged: (bool b) => {
                            changeState()
                          },
                          checkColor: Colors.black,
                          hoverColor: Colors.black,
                          activeColor: Colors.grey[400],
                        ),
                        InkWell(
                          child: Text(
                            'Don’t show again',
                            style: TextStyle(
                              fontFamily: 'GillSansMT',  
                              fontSize: (MediaQuery.of(context).size.height > 900) ? 30 : 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          onTap: changeState,
                        ),
                      ],
                    ),
                  ),     
                  Padding(
                    padding: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height > 700) ? 20 : 10),
                    child: CupertinoButton(
                      color: Colors.black,
                      onPressed: gotoPickACard,
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontFamily: 'GillSansMT',  
                            fontSize: (MediaQuery.of(context).size.height > 900) ? 30 : 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
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