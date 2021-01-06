import 'package:flutter/material.dart';

class MenuButtonWidget {
  final BuildContext context;

  MenuButtonWidget(this.context);

  Widget menuButton(String label, Function onClick) {
     return FlatButton(
      onPressed: onClick,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'GillSansMT',  
              fontSize: (MediaQuery.of(context).size.width/15)
            ),
          ),
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
    );
  }
}