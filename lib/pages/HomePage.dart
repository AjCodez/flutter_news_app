// @dart=2.9
import 'package:newsapp/components/customListTile.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/pages/NewsPage.dart';
import 'package:newsapp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Top HeadLines",
          ),
          actions: [
            IconButton(
                icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
                onPressed: () {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                }),
          ],
          //iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: FutureBuilder(
          future: client.getArticle('general'),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
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
                leading: const Icon(Icons.business),
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
                leading: const Icon(Icons.movie),
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
                leading: const Icon(Icons.sports_football),
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
                leading: const Icon(Icons.health_and_safety),
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
                leading: const Icon(Icons.science),
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
                leading: const Icon(Icons.lightbulb),
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
      ),
    );
  }
}
