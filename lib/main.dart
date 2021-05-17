import 'package:flutter/material.dart';
import 'home page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Artist Search',
      /*theme: ThemeData(
        primarySwatch: Color(0xFF121212),
      ),*/
      home: MyHomePage(title: 'Spotify Artist Search'),
    );
  }
}
