import 'package:flutter/material.dart';
import 'package:pole_purpose/services/sharedPref.dart';
import 'screens/saved.dart';
import 'data/theme.dart';



class SavedSetsMain extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SavedSetsMainState createState() => _SavedSetsMainState();
}

class _SavedSetsMainState extends State<SavedSetsMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      home: MySavedPage(title: 'Home'),
    );
  }
}