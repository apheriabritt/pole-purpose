import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            'Copyright',
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
          child: SafeArea(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Image.asset('images/polepurposelogo.png'),
                  Text('''
                      
All rights reserved. No part of this app may be reproduced by any mechanical, photographic or electronic process; or otherwise copied for public or private use – other than for “fair use” as brief quotations embodied in articles and reviews without prior written permission of Pole Purpose. These cards offer specialised information on pole dance choreography. In the event that you use any information from this app, Pole Purpose assumes no responsibility for your actions.

© Pole Purpose 2020

                      ''',textAlign: TextAlign.center,),
                ],
              ),
            )),
        ));
  }
}