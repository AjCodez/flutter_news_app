// @dart=2.9
import 'package:newsapp/services/api_service.dart';
import 'package:flutter/material.dart';
import '../components/customListTile.dart';
import '../model/article_model.dart';

class NewsBuilder extends StatelessWidget {
  ApiService client = ApiService();
  String category;
  NewsBuilder({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top ${category.replaceFirst(category[0], category[0].toUpperCase())} Headlines',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: client.getArticle(category),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
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
