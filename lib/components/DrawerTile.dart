import 'package:flutter/material.dart';
import '../main.dart';
import '../pages/NewsPage.dart';

class DrawerTile extends StatelessWidget {
  IconData icons;
  String title;

  DrawerTile(this.icons, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: ListTile(
        leading: Icon(
          icons,
          color: MyApp.themeNotifier.value == ThemeMode.light
              ? Colors.black
              : Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NewsBuilder(
              category: title,
            );
          }));
        },
      ),
    );
  }
}
