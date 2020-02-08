import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:kacheri/models/songs.dart';
import 'package:kacheri/pages/LyricPage.dart';
import 'package:kacheri/services/repository.dart';

class SongsPage extends StatefulWidget {
  SongsPage({Key key}) : super(key: key);

  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  List<Song> songs = new List<Song>();
  int songCount = 0;
  int pageNumber = 0;
  String name;
  var db = new SongProvider();
  @override
  void initState() {
    super.initState();
    // initDB();
    getData();
    getDataCount();
  }

  // initDB() async {
  //   await this.db.open();
  // }

  getDataCount() async {
    await this.db.open();
    var count = await db.getSongsCount();
    setState(() {
      this.songCount = count;
    });
  }

  getData() async {
    await this.db.open();
    var data = await this
        .db
        .getSongs(limit: 20, offset: this.pageNumber, name: this.name);
    if (data.length > 0) {
      setState(() {
        this.name == null ? "" : this.songs.clear();
        this.songs.addAll(data);
        this.pageNumber += 20;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Songs"),
      ),
      body: Column(
        children: <Widget>[
          Align(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Search song'),
                    onSubmitted: (value) async {
                      print(value);
                      this.name = value;
                      this.pageNumber = 0;
                      await this.getData();
                    },
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.search),
                //   onPressed: () {},
                // )
              ],
            ),
          )),
          Expanded(
              child: InfiniteListView.separated(
                  itemCount: this.songs.length,
                  hasNext: this.songs.length < songCount,
                  nextData: () async => this.getData(),
                  itemBuilder: (BuildContext ctxt, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LyricPage(song: this.songs[index]),
                          ),
                        );
                      },
                      leading: Icon(Icons.music_note),
                      title: Text(this.songs[index].name.length == 0
                          ? "N/A"
                          : this.songs[index].name),
                      subtitle: Text(this.songs[index].author),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        height: 2.0,
                      ))),
        ],
      ),
    );
  }
}
