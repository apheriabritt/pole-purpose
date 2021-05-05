import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pole_purpose/CONSTANTS/appbar.dart';


class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}


_getPosts() async {
  final response = await http.get(Uri.parse('https://www.polepurpose.com/index.php/wp-json/wp/v2/posts'));
  print('initial response: ${response.body}');
  List decoded = json.decode(response.body);
  print('first in list');
  print(decoded.first);
  Set decodemap = decoded.toSet();
  print('map:');
  decodemap.forEach((element) {
   print('title:');print( element['title']);

  });

}


class _BlogState extends State<Blog> {
  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar:customAppBarjustback,
              body: ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .35,
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'soon'
                      ),
                  ),
                ],
              ),
            );
  }
}