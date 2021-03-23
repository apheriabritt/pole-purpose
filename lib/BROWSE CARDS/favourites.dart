import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: FloatingActionButton(
              child:Icon(Icons.arrow_back),
              backgroundColor: Colors.black,
              onPressed:(){Navigator.pop(context);}
          ),
        ),
        body:Center(child:
        Transform.scale(
          scale:1,
          child:StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 10, //userfavelist,
            itemBuilder: (BuildContext context, int index) => Card(
              elevation: 0.0,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Transform.scale(
                      scale:0.75,
                      child: Card( child:Text('card'),)),
                ],
              ),
            ),
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.fit(2),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        )
        )
    );
  }
}
