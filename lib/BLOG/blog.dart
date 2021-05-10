import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:pole_purpose/BLOG/blogpost.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogPost

{

  String title,date,url,image;

  BlogPost(this.title,this.date,this.url,this.image);

}

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}



class _BlogState extends State<Blog> {
  Set decodemap;
  bool loading=true;

  List<BlogPost> blogList = [];

  void _getPosts() async {
    String photolink;
    final response = await http.get(Uri.parse('https://www.polepurpose.com/index.php/wp-json/wp/v2/posts?_embed'));
    List decoded = json.decode(response.body);
    decodemap = decoded.toSet();
    decodemap.forEach((element) {
      List ImageList = element['_embedded']['wp:featuredmedia'];
      print('title:${element['title']['rendered'].toString()}');
      print('date:${element['date'].toString()}');
      print('link:${element['link'].toString()}');
      ImageList.forEach((imageElement) {
        print('image:${imageElement['link']}');
        photolink=imageElement['link'];
      });
      BlogPost post = new BlogPost(
        element['title']['rendered'],
        element['date'],
        element['link'],
          photolink

      );
      blogList.add(post);
      print('done');

    });
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    print('building');
    return loading==true?Loading():Scaffold(
              appBar:customAppBarjustback,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: blogList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogPostView(blogList[index].url)));
                      }, //push to new page
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        shadowColor: Colors.black,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              leading: Image.network(blogList[index].image),
                              title:  Html(data:blogList[index].title),
                              subtitle: Text(blogList[index].date.replaceAll('T', ' ')),
                              trailing: Icon(Icons.arrow_forward_ios)

                          ),
                        ),
                      ),
                    );
                  }
                ),
              )
            );
  }
}
