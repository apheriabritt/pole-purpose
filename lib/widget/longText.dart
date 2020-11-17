import 'package:flutter/material.dart';

class LongTextWidget {
  final BuildContext context;

  LongTextWidget(this.context);

  Widget longText(int index, List<String> title, List<String> description) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left:20, right: 20, top: 10, bottom: 10),
            child: Text(
              title[index],
              style: TextStyle(
                fontFamily: 'GillSansMT',  
                fontSize: (MediaQuery.of(context).size.height > 900) ? 28 : 14,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Container(
            padding: EdgeInsets.only(left:20, right: 20, top: 10, bottom: 10),
            child: Text(
              description[index],
              style: TextStyle(
                fontFamily: 'GillSansMT',  
                fontSize: (MediaQuery.of(context).size.height > 900) ? 24 : 12,
              ),
            )
          ),
        ]
      ),
    );
  }
}