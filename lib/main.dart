import 'package:flutter/material.dart';
import 'package:kacheri/pages/HomePage.dart';
import 'package:kacheri/pages/SongsPage.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kacheri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/all-songs': (context) => SongsPage(),
      },
    );
  }
}
