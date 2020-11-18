import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pole_purpose/data/savedModels.dart';
import 'package:pole_purpose/services/savedDatabase.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/services.dart';

import 'package:pole_purpose/3CardMix.dart';

import 'package:pole_purpose/HomePage.dart';

class MySavedPage extends StatefulWidget {
  MySavedPage({Key key, this.title})
      : super(key: key) {
  }

  final String title;

  @override
  _MySavedPageState createState() => _MySavedPageState();
}

class _MySavedPageState extends State<MySavedPage> {
  bool isFlagOn = false;
  bool headerShouldHide = false;
  List<SavedModel> mixList = [];
  TextEditingController searchController = TextEditingController();

  bool isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    SavedDatabaseService.db.init();
    setNotesFromDB();

   SystemChannels.lifecycle.setMessageHandler((msg){
      debugPrint('SystemChannels> $msg');
      refetchSavedMixFromDB();
    });
  }

  setNotesFromDB() async {
    var fetchedNotes = await SavedDatabaseService.db.getNotesFromDB();
    setState(() {
      mixList = fetchedNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
          middle: const Text('Saved Sets',
            style: TextStyle(
              fontFamily: 'GillSansMT',  
              fontWeight: FontWeight.bold, fontSize: 18
            ),
          ),
           leading: GestureDetector(
            onTap: () {
              gotoMenu();
            },
            
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
          trailing: GestureDetector(
          child: Container(
            child: Icon(
              CupertinoIcons.refresh, 
              color: Colors.black,
              size:  (MediaQuery.of(context).size.height > 900) ? 56 : 36,
            )
          ),
          onTap: refetchSavedMixFromDB,  
        ),

        ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          goto3CardMix(-1, -1, -1, -1);
        },
        label: Text('ADD SET',
        style: TextStyle(
            fontFamily: 'GillSansMT',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: Icon(Icons.add,
        color:Colors.white),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  GestureDetector(
//                    behavior: HitTestBehavior.opaque,
//                    onTap: () {
//                      Navigator.push(
//                          context,
//                          CupertinoPageRoute(
//                              builder: (context) => SettingsPage(
//                                  changeTheme: widget.changeTheme)));
//                    },
//                    child: AnimatedContainer(
//                      duration: Duration(milliseconds: 200),
//                      padding: EdgeInsets.all(16),
//                      alignment: Alignment.centerRight,
//                      child: Icon(
//                        OMIcons.settings,
//                        color: Theme.of(context).brightness == Brightness.light
//                            ? Colors.grey.shade600
//                            : Colors.grey.shade300,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
            //  buildHeaderWidget(context),
            // if want to add search and important, uncomment below
            //  buildButtonRow(),
            //  buildImportantIndicatorText(),
              ...buildSavedMixComponentsList(),
            //  GestureDetector(onTap: goto3CardMix, child: AddNoteCardComponent()), 
            ],
          ),
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),
      ),
    );
  }

  Widget buildButtonRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                isFlagOn = !isFlagOn;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 160),
              height: 50,
              width: 50,
              curve: Curves.slowMiddle,
              child: Icon(
                isFlagOn ? Icons.flag : OMIcons.flag,
                color: isFlagOn ? Colors.white : Colors.grey.shade300,
              ),
              decoration: BoxDecoration(
                  color: isFlagOn ? Colors.blue : Colors.transparent,
                  border: Border.all(
                    width: isFlagOn ? 2 : 1,
                    color:
                    isFlagOn ? Colors.blue.shade700 : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.only(left: 16),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      maxLines: 1,
                      onChanged: (value) {
                        handleSearch(value);
                      },
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(isSearchEmpty ? Icons.search : Icons.cancel,
                        color: Colors.grey.shade300),
                    onPressed: cancelSearch,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeaderWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(top: 8, bottom: 32, right: 0),
            child: Icon(
              CupertinoIcons.back, 
              color: Colors.black,
              size:  (MediaQuery.of(context).size.height > 900) ? 60 : 40,
            )
          ),
          onTap: refetchSavedMixFromDB,  
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          margin: EdgeInsets.only(top: 8, bottom: 32, left: 0),
          width: headerShouldHide ? 0 : 200,
          child: Text(
            'Saved Sets',
            style: TextStyle(
                fontFamily: 'GillSansMT',
                fontWeight: FontWeight.w700,
                fontSize:  (MediaQuery.of(context).size.height > 900) ? 42 : 36,
                color: Colors.black
            ),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(top: 18, bottom: 32, left: 0),
            child: Icon(
              CupertinoIcons.refresh, 
              color: Colors.black,
              size:  (MediaQuery.of(context).size.height > 900) ? 60 : 40,
            )
          ),
          onTap: refetchSavedMixFromDB,  
        ),
      ],
    );
  }


  Widget buildImportantIndicatorText() {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 200),
      firstChild: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          'Only showing notes marked important'.toUpperCase(),
          style: TextStyle(
            fontFamily: 'GillSansMT',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      secondChild: Container(
        height: 2,
      ),
      crossFadeState:
      isFlagOn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  List<Widget> buildSavedMixComponentsList() {
    List<Widget> savedComponentsList = [];
    mixList.sort((a, b) {
      return b.id.compareTo(a.id);
    });
    /* add search
    if (searchController.text.isNotEmpty) {
      notesList.forEach((note) {
        if (note.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase()) ||
            note.content
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
          noteComponentsList.add(NoteCardComponent(
            noteData: note,
            onTapAction: openSavedMix,
          ));
      });
      return noteComponentsList;
    }

    if (isFlagOn) {
      notesList.forEach((note) {
        if (note.isImportant)
          noteComponentsList.add(NoteCardComponent(
            noteData: note,
            onTapAction: openSavedMix,
          ));
      });
    } else {
      mixList.forEach((note) {
        noteComponentsList.add(NoteCardComponent(
          noteData: note,
          onTapAction: openSavedMix,
        ));
      });
    }
    */
    
    mixList.forEach((note) {
        savedComponentsList.add(
          GestureDetector(
            onTap: () => goto3CardMix(note.card1, note.card2, note.card3, note.id),
            child: Container(
              padding: EdgeInsets.only(top:10),
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: "set_${note.id}",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[                
                    Padding(padding: EdgeInsets.all(2)),
                    Image.asset('images/cards/${note.card1}.png',width: MediaQuery.of(context).size.width/3.5),
                    Padding(padding: EdgeInsets.all(2)),
                    Image.asset('images/cards/${note.card2}.png',width: MediaQuery.of(context).size.width/3.5),
                    Padding(padding: EdgeInsets.all(2)),
                    Image.asset('images/cards/${note.card3}.png',width: MediaQuery.of(context).size.width/3.5),
                    Padding(padding: EdgeInsets.all(2)),
                  ]
                ),
              ),
            ),

          ),  
        );
      });

    return savedComponentsList;
  }

  void handleSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        isSearchEmpty = false;
      });
    } else {
      setState(() {
        isSearchEmpty = true;
      });
    }
  }

 
  gotoMenu() {  
        Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
  }

  void goto3CardMix(int card1, int card2, int card3, int id) {
    print("Goto card mix -> id: $id, $card1 $card2 $card3");
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardMix(card1, card2, card3, id)));
  }

  refetchSavedMixFromDB() async {
    await setNotesFromDB();
    print("Refetched notes");
  }

  openSavedMix(SavedModel noteData) async {
     setState(() {
      headerShouldHide = true;
    });

    await Future.delayed(Duration(milliseconds: 230), () {});
    goto3CardMix(-1, -1, -1, -1);

    await Future.delayed(Duration(milliseconds: 300), () {});

    setState(() {
      headerShouldHide = false;
    });
  }

  void cancelSearch() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      searchController.clear();
      isSearchEmpty = true;
    });
  }
}