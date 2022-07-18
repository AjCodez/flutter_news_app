// @dart=2.9
import 'dart:convert';

import 'package:newsapp/model/article_model.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<Article>> getArticle(String cat) async {
    String category = cat;
    Response res = await get(Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=504b3bd564c84625aa36b2148c04a0ef&pageSize=100"));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
