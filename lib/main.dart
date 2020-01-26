import 'package:flutter/material.dart';
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
      home: SongsPage(title: 'Kacheri'),
    );
  }
}

