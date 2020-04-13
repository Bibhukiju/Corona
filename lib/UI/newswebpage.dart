import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWeb extends StatefulWidget {
  final String links;
  NewsWeb({Key key,this.links}):super(key:key);
  @override
  _NewsWebState createState() => _NewsWebState();
}

class _NewsWebState extends State<NewsWeb> {
  final Completer<WebViewController> _controller=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: widget.links,  
        onWebViewCreated: (WebViewController web)
        {
          _controller.complete(web);
        },
      )
    );
  }
}