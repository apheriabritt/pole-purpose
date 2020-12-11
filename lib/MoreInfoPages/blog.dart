import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:flutter_html/flutter_html.dart';



class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  wp.WordPress wordPress = wp.WordPress(
    baseUrl: 'https://polepurpose.com',
  );

  _fetchPosts() {
    Future<List<wp.Post>> posts = wordPress.fetchPosts(
        postParams: wp.ParamsPostList(
          context: wp.WordPressContext.view,
          pageNum: 1,
          perPage: 25,
        ),
        fetchAuthor: false,
        fetchFeaturedMedia: false,
        fetchComments: false);
print('1');
    return posts;
  }

  _getPostImage(wp.Post post) {
    if (post.featuredMedia == null) {
      return SizedBox();
    }
    print('2');
    return Image.network(post.featuredMedia.sourceUrl,);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
        middle: const Text('Blog',
        style: TextStyle(
        fontFamily: 'GillSansMT',
        fontWeight: FontWeight.bold,
        fontSize: 18
    ),
    ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },

            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),

        ),
        child: Material(
          child: Container(
          child: FutureBuilder(
            future: _fetchPosts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<wp.Post>> snapshot) {
                  print('3');
                  if (snapshot.connectionState == ConnectionState.none) {
                return Container();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  wp.Post post = snapshot.data[index];
    return ExpansionTile(
                    title: Html(data:post.title.rendered.toString(),),
                      subtitle: Text(post.date.toString().replaceAll('T', ' ')),
                      children:[
                      Html(data:post.content.rendered.toString())
                    ]
                  );
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              _getPostImage(post),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                post.title.rendered.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(post.date.toString().replaceAll('T', ' ')),
                                ],
                              ),
                              Text(post.content.rendered)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
      ),
        ),
    );
  }
}
