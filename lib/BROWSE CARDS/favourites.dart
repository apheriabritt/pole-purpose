import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class ThreeCard
{

  String card1,card2,card3; ///the list of all single cards faved needs to be json decoded

  ThreeCard(this.card1,this.card2,this.card3);

}

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  String favelist;
  List SingleFaveList= [];
  FirebaseUser user;
  ///get favourites
  ///

  void getFaves() async{
    ///SINGLE CARD
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = await auth.currentUser();
    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
        "favourites/SINGLE/${user.uid}/faveList");
    postsRef.once().then((DataSnapshot snap) {
      SingleFaveList.clear();
        SingleFaveList = jsonDecode(snap.value);
        print(SingleFaveList);
      setState(() {});
    });
    ///for the fave list, get the details for each card
    ///THREE CARD... STRUGGLING WITH IT TBC
  }

  void initState() {
    super.initState();
   getFaves();
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
            children: [Center(child:
            Transform.scale(
              scale:1,
              child:StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: SingleFaveList.length, //userfavelist,
                itemBuilder: (BuildContext context, int index) => Card(
                  elevation: 0.0,
                  color: Colors.transparent,
                  child: Text(SingleFaveList[index])
                ),
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.fit(2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            )
            ),
            ///MIX VIEW
            Container()
          ])
      ),
    );
  }
}
