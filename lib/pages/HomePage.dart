// @dart=2.9
import 'package:newsapp/components/customListTile.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';

import '../components/DrawerTile.dart';

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
                setState(() {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                });
              },
            ),
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
              const DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 231, 231, 231)),
                child: Image(
                  image: NetworkImage(
                      'https://cdn.discordapp.com/attachments/787712939133108275/996446192315682987/know_more2.jpg'),
                ),
              ),
              DrawerTile(Icons.business, 'Business'),
              DrawerTile(Icons.movie, 'Entertainment'),
              DrawerTile(Icons.sports_basketball, 'Sports'),
              DrawerTile(Icons.health_and_safety, 'Health'),
              DrawerTile(Icons.science, 'Science'),
              DrawerTile(Icons.lightbulb, 'Technology'),
            ],
          ),
        ),
      ),
    );
  }
}
