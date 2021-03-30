import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pole_purpose/ADMIN/uploadCards.dart';
import 'package:pole_purpose/CONSTANTS/card.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';

class Mix

{

  String card1,card2,card3,id;
Mix(this.card1,this.card2,this.card3,this.id);
}

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> with TickerProviderStateMixin {
  String favelist;
  List SingleFaveList=[];
  List<Mix> MixFaveList=[];
  List<PPCard> CardList = [];

  TabController _tabController;
  int count=0;
  bool loading=true;
  bool loadingcard=true;

  FirebaseUser user;
  ///get favourites
  ///

  void getFaves() async{

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
        CardList.add(ppcard);
      }
      print('Length: $CardList.length');
    });

    final FirebaseAuth auth = FirebaseAuth.instance;
    user = await auth.currentUser();

    ///SINGLE CARD
    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
        "favourites/SINGLE/${user.uid}/faveList");
    await postsRef.once().then((DataSnapshot snap) {
      if(snap.value!=null){
      SingleFaveList.clear();
        SingleFaveList = jsonDecode(snap.value);}});
        print(SingleFaveList);



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


    @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
        tabs: [
          Tab(icon: Image.network('https://i.postimg.cc/G3jn0xvR/oie-transparent.png',width: 50,)),
          Tab(icon: Image.network('https://i.postimg.cc/vT2PYTQr/oie-transparent-1.png')),

        ])),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          extendBodyBehindAppBar: true,
          floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: FloatingActionButton(
                child:Icon(Icons.arrow_back),
                backgroundColor: Colors.black,
                onPressed:(){Navigator.pop(context);}
            ),
          ),
          body:TabBarView(
            controller: _tabController,
            children: [
              SingleFaveList==[]?Text('no favourites'):
              Center(child:
            Transform.scale(
              scale:1,
              child:
              StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: CardList.length,
                itemBuilder: (BuildContext context, int index) {
                  if(SingleFaveList.contains(CardList[index].id)){
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
                    ],
                  ),
                  );}
                  else{
                  return Container();}
                },
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.fit(2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            )
            ),
            ///MIX VIEW
              MixFaveList==[]?Text('no favourites'):
              ListView(
            children: [
            ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: MixFaveList.length,
      itemBuilder: (_, index) {

        return MixFaveList==[]? Text('no favourites mixes yet...'):
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
              width:MediaQuery.of(context).size.width/3.5,
              child: SingleCard(MixFaveList[index].card1,'','')),
      Container(
            width:MediaQuery.of(context).size.width/3.5,
            child: SingleCard(MixFaveList[index].card2,'','')),
      Container(
            width:MediaQuery.of(context).size.width/3.5,
            child: SingleCard(MixFaveList[index].card3,'',''))
      ],
        ),
         );})
          ])]
      ),
    ));
  }
}
