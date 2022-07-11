//Now let's create the article details page

import 'dart:io';

import 'package:newsapp/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: WebView(
        initialUrl: widget.article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
