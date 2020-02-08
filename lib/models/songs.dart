import 'dart:convert';

List<Song> songFromJson(String str) =>
    List<Song>.from(json.decode(str).map((x) => Song.fromJson(x)));

String songToJson(List<Song> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Song {
  String name;
  String nameLower;
  String raga;
  String author;
  String lyric;
  String id;

  Song({
    this.name,
    this.nameLower,
    this.raga,
    this.author,
    this.lyric,
    this.id,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        name: json["name"] == null ? null : json["name"],
        nameLower:
            json["name"] == null ? null : json["name"].toString().toLowerCase(),
        raga: json["raga"] == null ? null : json["raga"],
        author: json["author"] == null ? null : json["author"],
        lyric: json["lyric"] == null ? null : json["lyric"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "nameLower": nameLower == null ? null : nameLower.toLowerCase(),
        "raga": raga == null ? null : raga,
        "author": author == null ? null : author,
        "lyric": lyric == null ? null : lyric,
        "id": id == null ? null : id,
      };
}
