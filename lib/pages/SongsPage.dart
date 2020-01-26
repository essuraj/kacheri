import 'package:flutter/material.dart';
import 'package:kacheri/models/songs.dart';
import 'package:kacheri/services/repository.dart';

class SongsPage extends StatefulWidget {
  SongsPage({Key key}) : super(key: key);

  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  List<Song> songs = new List<Song>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var db = new SongProvider();
    await db.open();
    var data = await db.getSongs();
    setState(() {
      this.songs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Songs"),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: this.songs.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListTile(
                  // onTap: ,
                  title: Text(this.songs[index].name),
                  subtitle: Text(this.songs[index].author),
                );
              })),
    );
  }
}
