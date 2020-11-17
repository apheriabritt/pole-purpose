import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
//import 'package:pole_purpose/services/sharedPref.dart';
//import 'package:outline_material_icons/outline_material_icons.dart';
//import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  SettingsPage({Key key, Function(Brightness brightness) changeTheme})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedTheme;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (Theme
          .of(context)
          .brightness == Brightness.dark) {
        selectedTheme = 'dark';
      } else {
        selectedTheme = 'light';
      }
    });

    return Scaffold();
  }}



