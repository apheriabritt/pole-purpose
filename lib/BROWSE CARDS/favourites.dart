import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pole_purpose/ADMIN/uploadCards.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/card.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';

class Mix

{

  String card1,card2,card3,card1title,card2title,card3title,card1content,card2content,card3content,id;
Mix(this.card1,this.card2,this.card3,this.card1title,this.card2title,this.card3title,this.card1content,this.card2content,this.card3content,this.id);
}

class Favourites extends StatefulWidget {


  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> with TickerProviderStateMixin {
  String favelist;
  bool loadingcard=false;
  List SingleFaveList=[];
  List<Mix> MixFaveList=[];
  List<PPCard> CardList = [];

  TabController _tabController;
  int count=0;
  bool loading=true;

  User user;
  ///get favourites
  ///

  Future<void> getFaves() async{
    setState(() {
      loading=true;
    });
    SingleFaveList.clear();
    MixFaveList.clear();
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;
///SINGLE CARD
    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
        "favourites/SINGLE/${user.uid}/faveList");
    await postsRef.once().then((DataSnapshot snap) {
      if(snap.value!=null){
      SingleFaveList.clear();
        SingleFaveList = jsonDecode(snap.value);}});
        print(SingleFaveList);

    DatabaseReference postsRef3 = FirebaseDatabase.instance.reference().child(
        "cards");
    postsRef3.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      CardList.clear();

      for (var individualKey in KEYS) {
        PPCard ppcard = new PPCard(
          DATA[individualKey]['title'],
          DATA[individualKey]['image'],
          DATA[individualKey]['id'],
          DATA[individualKey]['content'],
        );
        String id = DATA[individualKey]['id'];
        if(SingleFaveList.contains(id)){
          CardList.add(ppcard);}
      }
      print('Length: $CardList.length');
    });

    ///THREE CARD

      DatabaseReference postsRef2 = FirebaseDatabase.instance.reference().child(
          "favourites/MIX/${user.uid}");
      await postsRef2.once().then((DataSnapshot snap) {
        print('snap is $snap');
        if(snap.value!=null){
        var KEYS = snap.value.keys;
        var DATA = snap.value;
        for (var individualKey in KEYS) {
          Mix mix = new Mix(
              DATA[individualKey]['card1'],
              DATA[individualKey]['card2'],
              DATA[individualKey]['card3'],
              DATA[individualKey]['card1title'],
              DATA[individualKey]['card2title'],
              DATA[individualKey]['card3title'],
              DATA[individualKey]['card1content'],
              DATA[individualKey]['card2content'],
              DATA[individualKey]['card3content'],
              DATA[individualKey]['id']

          );
        MixFaveList.add(mix);
      }}});

      print('got em');
      setState(() {
        loading=false;
      });
  }

  void initState() {
    super.initState();
    loadingcard=true;
   getFaves();
    void _handleTabChange() {
      if (_tabController.indexIsChanging) {
        print('changed');
      setState(() {

      });}
    }

    _tabController = TabController(
        vsync: this,
        length: 2
    );
    _tabController.addListener(_handleTabChange);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void deletecheck(String id,bool single) {
    setState(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (context, setState) {
                  // return object of type Dialog
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      backgroundColor: Colors.white.withOpacity(1),
                      title: new Text("remove favourite?", style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black),),
                      content: Container(
                          width: 150, height: 100,
                          child: ListView(
                              children: <Widget>[
                                Text(
                                    "are you sure you want to remove? this can't be undone."),

                              ],
                          )
                      ),

                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("cancel", style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                              child: new Text("delete", style: TextStyle(
                                  fontSize: 30.0,color:Colors.black)),
                              onPressed: (){delete(id,single);}
                          ),
                        )
                      ]);
                });
          }
      );
    }
    );
  }

  void delete(String id,bool single) async {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    if(single==true){
    String faveListString;
    await ref
        .child('favourites/SINGLE/${user.uid}/faveList')
        .once()
        .then((snapshot){faveListString=snapshot.value;});
    if (faveListString==null){faveListString='[]';}
    SingleFaveList = await json.decode(faveListString);
    print('hii');
    //= CardList.first.key.toString();
    print('fave list is $SingleFaveList');
    if(SingleFaveList.contains(id)){
      print('removing');
      SingleFaveList.remove(id);
      SingleFaveList = SingleFaveList.toSet().toList();
      //remove duplicates
      faveListString = json.encode(SingleFaveList);
      var data =
      {
        "faveList": faveListString,
      };

      await ref.child("favourites").child('SINGLE').child(user.uid).set(data);
      print('removed');}}
    else{
      print('removing');
      FirebaseDatabase.instance.reference().child("favourites").child('MIX').child(user.uid).child(id).remove();
    }
      Navigator.pop(context);
   getFaves();
  }


    @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2,
      child: Scaffold(
        appBar: customAppBarjustback,
          body:Column(
            children: [
              TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(icon: Image.network('https://i.postimg.cc/G3jn0xvR/oie-transparent.png',width: 50,)),
                    Tab(icon: Image.network('https://i.postimg.cc/vT2PYTQr/oie-transparent-1.png')),
                  ]),
              loading==true?Container():Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ///SINGLE VIEW
                    SingleFaveList==[]?Text('no favourites'):
                    Center(child:
                  Transform.scale(
                    scale:1,
                    child:
                    StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: CardList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                        elevation: 0.0,
                        color: Colors.transparent,
                        child:Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                  scale:1,
                                  child: SingleCard(CardList[index].id,CardList[index].title,CardList[index].content)),
                            ),
                            //FAB
                            Positioned(
                              bottom:0,right:0,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: FloatingActionButton(
                                  mini:true,
                                    onPressed:(){deletecheck(CardList[index].id,true);},
                                    heroTag: CardList[index].id,
                                    backgroundColor: Colors.black,
                                    child:Icon(Icons.close)
                                ),
                              ),
                            ),
                          ],
                        ),
                        );
                        },
                      staggeredTileBuilder: (int index) =>
                      new StaggeredTile.fit(2),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                  )
                  ),
                  ///MIX VIEW
                    ///
                    MixFaveList==[]?Center(child: Text('no favourites',style:TextStyle(color:Colors.black))):
                    ListView(
                  children: [
                  ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: MixFaveList.length,
      itemBuilder: (_, index) {
        String id = '${MixFaveList[index].card1}${MixFaveList[index].card2}${MixFaveList[index].card3}';
       return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
                    width:MediaQuery.of(context).size.width/4,
                    child: SingleCard(MixFaveList[index].card1,MixFaveList[index].card1title,MixFaveList[index].card1content)),
      Container(
                  width:MediaQuery.of(context).size.width/4,
                child: SingleCard(MixFaveList[index].card2,MixFaveList[index].card2title,MixFaveList[index].card2content)),
      Container(
                  width:MediaQuery.of(context).size.width/4,
                child: SingleCard(MixFaveList[index].card3,MixFaveList[index].card3title,MixFaveList[index].card3content)),
        FloatingActionButton(
            mini:true,
            onPressed:(){deletecheck(id,false);},
            heroTag: id,
            backgroundColor: Colors.black,
            child:Icon(Icons.close)
        ),
      ],
        ),
         );})
                ])]
      ),
              ),
            ],
          ),
    ));
  }
}
