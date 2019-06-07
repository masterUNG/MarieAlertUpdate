import 'package:flutter/material.dart';
import 'package:mariealert/screens/show_news_list.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowNewsList(),
    );
  }
}
