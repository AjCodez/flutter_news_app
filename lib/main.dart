// @dart=2.9
import 'package:newsapp/pages/HomePage.dart';
import 'package:newsapp/pages/NewsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(color: Colors.redAccent),
              primaryColor: Colors.red[50],
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const HomePage(),
            routes: {
              '/news/': (context) => NewsBuilder(),
            },
          );
        });
  }
}
