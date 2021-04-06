import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';
import 'package:url_launcher/url_launcher.dart';

class Author extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: customAppBarjustback,
      body: DraggableScrollbar.rrect(
        controller: controller,
        alwaysVisibleScrollThumb: true,
        backgroundColor: Colors.black.withOpacity(0.75),
        padding: EdgeInsets.all(0.0),
        child: ListView(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          '''
Rowena Gander is an international performance artist with a BA and an MA in dance practices. Her thought provoking solo performance works question and negotiate themes of sexuality, power and objectification in women. Since 2015 she has worked with stigmatised objects; the vertical pole and high heels, to tease out how objects can add to or dissolve female subordination. 

Alongside performance work she loves to teach in pole and contemporary dance and has a real passion and drive for helping people find confidence in themselves through movement and creativity. Taking an all-inclusive approach, her facilitation methods are always centred on student ability in pole and non-pole dancing. 

Rowena Gander                         ''',style:TextStyle(fontSize:20)
                        ),
                      )
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
                            color: Colors.black,
                          ),

                        ),
                        onPressed: () => launch('http://www.rowenagander.com/')
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}