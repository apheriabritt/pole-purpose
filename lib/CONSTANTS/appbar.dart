
import 'package:flutter/material.dart';
var customAppBarjustback =
PreferredSize(
  preferredSize: Size.fromHeight(100.0), // here the desired height
  child: SafeArea(
    child: Container(
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          StatefulBuilder(

              builder: (context, setState) {

                return

                  Padding(

                      padding: const EdgeInsets.all(15.0),

                      child: FloatingActionButton(
                        backgroundColor:Colors.black,
                        heroTag: 'backbutton',
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_){

                            Navigator.of(context).pop();

                          });},
                        elevation: 2.0,
                        child: Icon(
                            Icons.arrow_back,
                            size: 35.0,color:Colors.white
                        ),
                      )

                  );

              }),


        ],

      ),
    ),
  ),
);
