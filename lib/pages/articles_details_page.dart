import 'dart:io';

import 'package:newsapp/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
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
              return [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.browser,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.open_in_browser,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text("Open in Browser"),
                    ],
                  ),
                ),
                PopupMenuItem<MenuAction>(
                  value: MenuAction.share,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.share,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text("Share"),
                    ],
                  ),
                )
              ];
            },
            onSelected: (value) async {
              if (value == MenuAction.browser) {
                if (await canLaunchUrl(Uri.parse(widget.article.url))) {
                  await launchUrl(Uri.parse(widget.article.url));
                } else {
                  throw "Could not launch";
                }
              } else if (value == MenuAction.share) {
                final url = widget.article.url;
                await Share.share(
                    'Check out this news via Know More app : $url');
              }
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
