import 'dart:io';

import 'package:newsapp/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

enum MenuAction { browser, share }

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        actions: [
          PopupMenuButton<MenuAction>(
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.browser,
                  child: Text("Open in browser"),
                )
              ];
            },
            onSelected: (value) async {
              if (await canLaunchUrl(Uri.parse(widget.article.url))) {
                await launchUrl(Uri.parse(widget.article.url));
              } else {
                throw "Could not launch";
              }
            },
          )
        ],
      ),
      body: WebView(
        initialUrl: widget.article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
