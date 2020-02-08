import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:kacheri/models/songs.dart';
import 'package:sqflite/sqflite.dart';

final String tableSong = 'songs';
final String columnId = 'id';
final String columnName = 'name';
final String columnNameLower = 'nameLower';
final String columnRaga = 'raga';
final String columnAuthor = 'author';
final String columnLyric = 'lyric';

class SongProvider {
  Database db;

  Future open() async {
    db = await openDatabase(
      "songs_db",
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
create table $tableSong ( 
  $columnId text primary key, 
  $columnName text not null,
  $columnNameLower text not null,
  $columnRaga text not null,
  $columnAuthor text not null,
  $columnLyric text not null)
''');
        var data = await rootBundle.loadString('assets/op-song.json');
        final songs = await compute(songFromJson, data);
        var batch = db.batch();
        songs.forEach((d) => (batch.insert(tableSong, d.toJson())));
        await batch.commit(noResult: true);
      },
      singleInstance: true,
    );
  }

  // Future<Song> insert(Song song) async {
  //   song.id = await db.insert(tableSong, song.toMap());
  //   return song;
  // }

  Future<Song> getSong(String id) async {
    List<Map> maps =
        await db.query(tableSong, where: '$columnId = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Song.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Song>> getSongs(
      {int offset = 0, int limit = 10, String name}) async {
    List<Song> list = new List<Song>();

    List<Map<String, dynamic>> dbList = name == null
        ? await db.query(tableSong, limit: limit, offset: offset)
        : await db.query(tableSong,
            limit: limit,
            offset: offset,
            where: "$columnNameLower like ?",
            whereArgs: ['%$name%']);

    dbList.forEach((itemMap) {
      list.add(Song.fromJson(itemMap));
    });
    return list;
  }

  Future<int> getSongsCount() async {
    int count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableSong'));
    return count;
  }
  // Future<int> delete(int id) async {
  //   return await db.delete(tableSong, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> update(Song song) async {
  //   return await db.update(tableSong, song.toJson(),
  //       where: '$columnId = ?', whereArgs: [song.id]);
  // }

  Future close() async => db.close();
}
