
import 'dart:math';

import 'package:flutter/cupertino.dart';

class NotesModel {
  int id;
  String title;
  String imageUrl;
  int imageNumber;
  String content;
  Image image;
  bool isImportant;
  DateTime date;

  NotesModel({this.id, this.title,this.imageUrl, this.imageNumber, this.content, this.isImportant, this.date, });

  NotesModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.title = map['title'];
    this.imageUrl = map['imageUrl'];
    this.imageNumber = map['imageNumber'];
    this.content = map['content'];
    this.image = map['image'];  
    this.date = DateTime.parse(map['date']);
    this.isImportant = map['isImportant'] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      'title': this.title,
//      'imageUrl' : this.imageUrl,
//      'imageNumber' : this.imageNumber,
      'content': this.content,
//      'image': this.image,
      'isImportant': this.isImportant == true ? 1 : 0,
      'date': this.date.toIso8601String()
    };
  }

  NotesModel.random() {
    this.id = Random(10).nextInt(1000) + 1;
    this.title = 'Lorem Ipsum ' * (Random().nextInt(4) + 1);
//    this.imageUrl = 'Lorem Ipsum ' * (Random().nextInt(4) + 1);
//    this.imageNumber = 1 * (Random().nextInt(4) + 1);
    this.content = 'Lorem Ipsum ' * (Random().nextInt(4) + 1);
//    this.image = Image.asset('images/cards/1.png');
    this.isImportant = Random().nextBool();
    this.date = DateTime.now().add(Duration(hours: Random().nextInt(100)));
  }
}