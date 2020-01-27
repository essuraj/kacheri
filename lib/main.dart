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
          primarySwatch: Colors.deepOrange,
          primaryColorDark: Colors.deepOrangeAccent,
          cardTheme: CardTheme(
            // color: const Color(0xFFffffff).withOpacity(0.6),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          )),
      routes: {
        '/': (context) => HomePage(),
        '/all-songs': (context) => SongsPage(),
        '/all-songs': (context) => SongsPage(),
      },
    );
  }
}
