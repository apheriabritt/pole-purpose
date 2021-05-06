import 'package:animate_do/animate_do.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/playSound.dart';

///i might re enter the card info into a FBDB.
//then get the card widget
bool front=true;

class SingleCard extends StatefulWidget {
  String id,title,content;
  SingleCard(this.id,this.title,this.content);
  @override
  _SingleCardState createState() => _SingleCardState(this.id,this.title,this.content);
}

class _SingleCardState extends State<SingleCard> {
 AnimationController _animateController;
 ScrollController controller = ScrollController();
 String id,title,content;
  _SingleCardState(this.id,this.title,this.content);
  @override
  Widget build(BuildContext context) {
    return Container(
      //height:MediaQuery.of(context).size.height,
      //width:MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: GestureDetector(
          onTap: () async {
            _animateController.reset();
            _animateController.forward();
            print('flipped');
            if (front == true) {
              setState(() {
                front = false;
              });
            }
            else {
              setState(() {
                front = true;
              });
            }
          },
          onLongPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Scaffold(
                            appBar: customAppBarjustback,
                            extendBodyBehindAppBar: true,
                            body: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Center(
                                  child: SingleCard(id, title, content)),
                            )
                        )));
          },
          child: FittedBox(
            child: FlipInY(
              controller: (controller) => _animateController = controller,
              manualTrigger: true,
              child: front == true ? FittedBox(
                child: Container(
                  height: 1000, width: 650,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(title, style: TextStyle(
                              fontFamily: 'Xtreem', fontSize: 75)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:
                          //Image.network(image,fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1)
                          Image.asset(
                              'images/assets/CARDS/$id.png', fit: BoxFit.fill),
                        ),
                      ],
                    )), elevation: 10,),
                ),
              ) : FittedBox(
                child: Container(
                  height: 1000, width: 650,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(title, style: TextStyle(
                              fontFamily: 'Xtreem', fontSize: 75)),
                        ),
                        Container(
                          height: 750,
                          child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child:
                              Center(child: DraggableScrollbar.rrect(
                                  controller: controller,
                                  alwaysVisibleScrollThumb: true,
                                  backgroundColor: Colors.black.withOpacity(
                                      0.75),
                                  padding: EdgeInsets.all(0.0),
                                  child: ListView(
                                      controller: controller,
                                      children: [
                                        Text(content,
                                            style: TextStyle(fontSize: 35))
                                      ])))
                            //Image.network(image,fit:BoxFit.contain,width:MediaQuery.of(context).size.width/1)
                          ),
                        ),
                        id == 'Everyday-Movement' ? GestureDetector(
                            onTap: () async {
                              String thisid = 'Everyday-Movements';
                              String thistitle = '';
                              DatabaseReference ref = FirebaseDatabase.instance
                                  .reference();
                              await ref
                                  .child('cards/Everyday-Movements/title')
                                  .once()
                                  .then((snapshot) {
                                thistitle = snapshot.value;
                              });
                              print('this title is $thistitle');
                              String thiscontent = '';
                              await ref
                                  .child('cards/$thisid/content')
                                  .once()
                                  .then((snapshot) {
                                thiscontent = snapshot.value;
                              });
                              print('this content is $thiscontent');

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Scaffold(
                                              appBar: customAppBarjustback,
                                              extendBodyBehindAppBar: true,
                                              body: Padding(
                                                padding: const EdgeInsets.all(
                                                    25.0),
                                                child: Center(child: SingleCard(
                                                    thisid, thistitle,
                                                    thiscontent)),
                                              )
                                          )));
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.white,
                                shadowColor: Colors.black,
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('View Everyday Movements',
                                      style: TextStyle(fontSize: 35)),
                                )
                            )
                        ) : Container(),
                        id == 'Restricting-Freedom' ? GestureDetector(
                            onTap: () async {
                              String thisid = 'Action-Descriptive-Words';
                              String thistitle = '';
                              DatabaseReference ref = FirebaseDatabase.instance
                                  .reference();
                              await ref
                                  .child('cards/$thisid/title')
                                  .once()
                                  .then((snapshot) {
                                thistitle = snapshot.value;
                              });
                              print('this title is $thistitle');
                              String thiscontent = '';
                              await ref
                                  .child('cards/$thisid/content')
                                  .once()
                                  .then((snapshot) {
                                thiscontent = snapshot.value;
                              });
                              print('this content is $thiscontent');

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Scaffold(
                                              appBar: customAppBarjustback,
                                              extendBodyBehindAppBar: true,
                                              body: Padding(
                                                padding: const EdgeInsets.all(
                                                    25.0),
                                                child: Center(child: SingleCard(
                                                    thisid, thistitle,
                                                    thiscontent)),
                                              )
                                          )));
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.white,
                                shadowColor: Colors.black,
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('Action & Descriptive Words',
                                      style: TextStyle(fontSize: 35)),
                                )
                            )
                        ) : Container()
                      ],
                    )), elevation: 10,),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

