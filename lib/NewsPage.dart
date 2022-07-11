// @dart=2.9
import 'package:newsapp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'components/customListTile.dart';
import 'model/article_model.dart';

class Builder extends StatelessWidget {
  ApiService client = ApiService();
  Builder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticle(),
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
    );
  }
}
