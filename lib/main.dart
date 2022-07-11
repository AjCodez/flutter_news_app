// @dart=2.9
import 'package:newsapp/pages/HomePage.dart';
import 'package:newsapp/pages/NewsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/news/': (context) => NewsBuilder(),
      },
    );
  }
}
