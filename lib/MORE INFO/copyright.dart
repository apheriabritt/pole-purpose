import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/hamburger.dart';

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(extendBodyBehindAppBar: true,
        appBar: customAppBarjustback,
        body: Material(
          color:Colors.white,
          child: SafeArea(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: DraggableScrollbar.rrect(
                controller: controller,
                alwaysVisibleScrollThumb: true,
                backgroundColor: Colors.black.withOpacity(0.75),
                child: ListView(
                  controller: controller,
                  children: [
                    Image.asset('images/polepurposelogo.png'),
                    Text('''
                        
All rights reserved. No part of this app may be reproduced by any mechanical, photographic or electronic process; or otherwise copied for public or private use – other than for “fair use” as brief quotations embodied in articles and reviews without prior written permission of Pole Purpose. These cards offer specialised information on pole dance choreography. In the event that you use any information from this app, Pole Purpose assumes no responsibility for your actions.

© Pole Purpose 2020

                        ''',textAlign: TextAlign.center,style:TextStyle(fontSize:20)),
                  ],
                ),
              ),
            )),
        ));
  }
}