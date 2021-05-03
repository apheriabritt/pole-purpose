import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pole_purpose/BLOG/models/single_post.dart';
import 'package:pole_purpose/BLOG/ui/screens/post.dart';
import 'package:pole_purpose/BLOG/ui/widgets/overlayed_container.dart';
import 'package:pole_purpose/BLOG/ui/widgets/post_container.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

List<SinglePost> parsePosts(response) {
  final parsed = jsonDecode(response)['posts'].cast<Map<String, dynamic>>();
  return parsed.map<SinglePost>((json) => SinglePost.fromJson(json)).toList();
}

Future<List<SinglePost>> _getPosts() async {
  final response = await http.get(Uri.parse('https://public-api.wordpress.com/rest/v1.1/sites/polepurpose.com/posts'));
  return compute(parsePosts, response.body);
}

class _BlogState extends State<Blog> {
  Future<List<SinglePost>> _postsFuture;
  @override
  void initState() {
    super.initState();
    _postsFuture = _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<SinglePost>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Scaffold(
              appBar: customAppBarjustback,
              body: Center(
                child: Text("Error"),
              ),
            );
          if (snapshot.hasData) {
            return Scaffold(
              appBar:customAppBarjustback,
              body: ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .35,
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    child: PageView.builder(
                      controller: PageController(viewportFraction: .76),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) => OverlayedContainer(
                        authorAvatar: "${snapshot.data[i].avatarURL}",
                        author: "${snapshot.data[i].authorName}",
                        image: "${snapshot.data[i].featuredImage}",
                        title: "${snapshot.data[i].title}",
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PostScreen(postData: snapshot.data[i]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "All Posts",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, i) => PostContainer(
                            author: "${snapshot.data[i].authorName}",
                            image: "${snapshot.data[i].featuredImage}",
                            title: "${snapshot.data[i].title}",
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostScreen(postData: snapshot.data[i]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}