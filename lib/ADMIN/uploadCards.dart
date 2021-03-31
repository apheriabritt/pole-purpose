import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';

class PPCard

{

  String title,image,content,id;

  PPCard(this.title,this.image,this.id,this.content);

}

class AddPPCards extends StatefulWidget {
  PPCard data;
  AddPPCards({Key key, this.data}) : super(key: key);

  @override
  _AddPPCardsState createState() => _AddPPCardsState(this.data);
}

class _AddPPCardsState extends State<AddPPCards> {
  PPCard data;
  _AddPPCardsState(this.data);
  List<PPCard> ppcardList = [];

  String title;
  String content;
  String id;
  File image;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(data.title!=null){title=data.title;}
    if(data.content!=null){content=data.content;}


    print('here');
    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
        "cards");
    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      ppcardList.clear();

      for (var individualKey in KEYS) {
        PPCard ppcard = new PPCard(
          DATA[individualKey]['title'],
          DATA[individualKey]['image'],
          DATA[individualKey]['id'],
          DATA[individualKey]['content'],

        );
        ppcardList.add(ppcard);
      }
      print('Length: $ppcardList.length');
      setState(() {

      });
    });}

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    else {
      return false;
    }
  }

  void upload()async{
    var dbTimeKey = new DateTime.now();
    String stringimage;
    if(data.image!=null){stringimage=data.image;}
    if(image!=null){
      final StorageReference postImageRef = FirebaseStorage.instance.ref()
          .child('card images');

      StorageUploadTask uploadTask =

      postImageRef.child(
          dbTimeKey.toString() + ".jpg").putFile(image);

      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

      stringimage = ImageUrl.toString();}

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    if(data.id!=null){id=data.id;}


    var uploaddata =
    {
      "title": title,
      "content": content,
      "image" :'',
      "id":id,


    };
    ref.child("cards").child(id.toString()).update(uploaddata);
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBarjustback,
        floatingActionButton:
        FloatingActionButton(
            backgroundColor: Colors.black,
            heroTag: 'upload',
            child:Icon(Icons.send,color:Colors.white),
            onPressed: (){
              if(validateAndSave())
               {

                upload();
              };}),
        extendBodyBehindAppBar: true,
        body: Container(

            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(cursorColor: Colors.black,
                      decoration: InputDecoration(labelText: 'add id',labelStyle: TextStyle(color:Colors.black)),
                      maxLines: 1,
                      initialValue: data.id,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'write something!';
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        return id = value;
                      },
                    ),
                    TextFormField(cursorColor: Colors.black,
                      decoration: InputDecoration(labelText: 'add title',labelStyle: TextStyle(color:Colors.black)),
                      maxLines: 1,
                      initialValue: data.title,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'write something!';
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        return title = value;
                      },
                    ),
                    TextFormField(cursorColor: Colors.black,
                      decoration: InputDecoration(labelText: 'add content',labelStyle: TextStyle(color:Colors.black)),
                      maxLines: 25,
                      initialValue: data.content,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'write something!';
                        }
                        return null;
                      },
                      onSaved: (value)
                      {
                        return content = value;
                      },
                    ),



                  ],
                ),
              ),
            )

        ));
  }
}