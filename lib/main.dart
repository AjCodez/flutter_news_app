// @dart=2.9
import 'package:newsapp/pages/HomePage.dart';
import 'package:newsapp/pages/NewsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.dark);

  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              appBarTheme: const AppBarTheme(
                color: Color(0xFF326789),
              ),
              primaryColor: Color(0xFF78A6C8),
              scaffoldBackgroundColor: Color(0xFFE9EEF2),
              drawerTheme: DrawerThemeData(
                backgroundColor: Color(0xFFE9EEF2),
              ),
              iconTheme: IconThemeData(size: 30),
            ),
            darkTheme: ThemeData.dark().copyWith(
              iconTheme: IconThemeData(size: 30, color: Colors.white),
            ),
            themeMode: currentMode,
            home: const HomePage(),
            routes: {
              '/news/': (context) => NewsBuilder(),
            },
          );
        });
  }
}
