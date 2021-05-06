import 'package:flutter/material.dart';
import 'package:pole_purpose/CONSTANTS/appbar.dart';
import 'package:pole_purpose/CONSTANTS/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogPostView extends StatefulWidget {

  String link;
  BlogPostView(this.link);
  @override
  _BlogPostViewState createState() => _BlogPostViewState(this.link);
}

class _BlogPostViewState extends State<BlogPostView> {
  String link;
  bool loading=true;
  _BlogPostViewState(this.link);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: customAppBarjustback,
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        body: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Stack(
                children: [
                  WebView(
                          initialUrl:link,
                          javascriptMode: JavascriptMode
                              .unrestricted,
                          onPageFinished: (finish) {
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                  loading==true?Loading():Container()
                ],

              ),

            )
    );
  }
}
