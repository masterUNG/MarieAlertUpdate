import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ShowNewsList extends StatefulWidget {
  @override
  _ShowNewsListState createState() => _ShowNewsListState();
}

class _ShowNewsListState extends State<ShowNewsList> {
  // Firebase
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupFirebaseMessaging();
  }

  void setupFirebaseMessaging() {
    // Find Token
    firebaseMessaging.getToken().then((value) {
      print('Token ==> $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Show New List'),
      ),
    );
  }
}
