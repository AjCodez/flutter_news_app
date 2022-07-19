import 'dart:io';
import 'package:newsapp/main.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
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

  Row PopUpMenuTile(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 25,
          color: MyApp.themeNotifier.value == ThemeMode.light
              ? Colors.black
              : Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
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
                    child: PopUpMenuTile(
                        Icons.open_in_browser, 'Open in browser')),
                PopupMenuItem<MenuAction>(
                  value: MenuAction.share,
                  child: PopUpMenuTile(Icons.share, 'Share'),
                ),
              ];
            },
            onSelected: (value) async {
              if (value == MenuAction.browser) {
                if (await canLaunchUrlString(widget.article.url)) {
                  await launchUrlString(widget.article.url,
                      mode: LaunchMode.externalApplication);
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
