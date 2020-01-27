import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kacheri/models/songs.dart';

class LyricPage extends StatefulWidget {
  Song song;
  LyricPage({Key key, Song song}) : super(key: key) {
    this.song = song;
  }

  @override
  _LyricPageState createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.name.length == 0 ? "N/A" : widget.song.name),
      ),
      body: SafeArea(
          child: Container(
        // padding: EdgeInsets.all(8),
        child: Markdown(data: widget.song.lyric),
      )),
    );
  }
}
