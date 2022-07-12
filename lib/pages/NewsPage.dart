// @dart=2.9
import 'package:newsapp/services/api_service.dart';
import 'package:flutter/material.dart';
import '../components/customListTile.dart';
import '../model/article_model.dart';

class NewsBuilder extends StatefulWidget {
  final String category;
  const NewsBuilder({Key key, this.category}) : super(key: key);

  @override
  State<NewsBuilder> createState() => _NewsBuilderState();
}

class _NewsBuilderState extends State<NewsBuilder> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top ${widget.category.replaceFirst(widget.category[0], widget.category[0].toUpperCase())} Headlines',
        ),
        //backgroundColor: Colors.white,
        //iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: client.getArticle(widget.category),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
