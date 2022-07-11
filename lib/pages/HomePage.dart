// @dart=2.9
import 'package:newsapp/components/customListTile.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/pages/NewsPage.dart';
import 'package:newsapp/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: client.getArticle('general'),
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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Business'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewsBuilder(
                    category: 'business',
                  );
                }));
              },
            ),
            ListTile(
              title: const Text('Entertainment'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewsBuilder(
                    category: 'entertainment',
                  );
                }));
              },
            ),
            ListTile(
              title: const Text('Sports'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewsBuilder(
                    category: 'sports',
                  );
                }));
              },
            ),
            ListTile(
              title: const Text('Health'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewsBuilder(
                    category: 'health',
                  );
                }));
              },
            ),
            ListTile(
              title: const Text('Science'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewsBuilder(
                    category: 'science',
                  );
                }));
              },
            ),
            ListTile(
              title: const Text('Technology'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewsBuilder(
                    category: 'technology',
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
