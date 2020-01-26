import 'package:flutter/material.dart';
import 'package:kacheri/songs.dart';
import '../repository.dart';

class SongsPage extends StatefulWidget {
  SongsPage({Key key, this.title}) : super(key: key);

  final String title;

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
        title: Text(widget.title),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: this.songs.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListTile(
                  title: Text(this.songs[index].name),
                  subtitle: Text(this.songs[index].author),
                );
              })),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.filter_list),
        onPressed: () {},
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
