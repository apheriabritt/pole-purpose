import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogPost

{

  String title,date,url;

  BlogPost(this.title,this.date,this.url);

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
    final response = await http.get(Uri.parse('https://www.polepurpose.com/index.php/wp-json/wp/v2/posts'));
    List decoded = json.decode(response.body);
    decodemap = decoded.toSet();
    decodemap.forEach((element) {

      print('title:${element['title']['rendered'].toString()}');
      print('date:${element['date'].toString()}');
      print('link:${element['link'].toString()}');

      BlogPost post = new BlogPost(
        element['title']['rendered'],
        element['date'],
        element['link'],
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
              body: ListView.builder(
                itemCount: blogList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return
                              SafeArea(
                                child: Scaffold(extendBodyBehindAppBar: true,
                                    backgroundColor: Colors.white,
                                    floatingActionButtonLocation: FloatingActionButtonLocation
                                        .startTop,
                                    floatingActionButton:
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.black,
                                        child: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    body: Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: WebView(
                                            initialUrl:blogList[index].url ,
                                            javascriptMode: JavascriptMode
                                                .unrestricted,
                                          ),
                                        ))
                                ),
                              );
                            ////////////////////
                          }));
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
                            title:  Html(data:blogList[index].title),
                            subtitle: Text(blogList[index].date.replaceAll('T', ' ')),
                            trailing: Icon(Icons.arrow_forward_ios)

                        ),
                      ),
                    ),
                  );
                }
              )
            );
  }
}
