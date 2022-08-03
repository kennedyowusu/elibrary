import 'dart:convert';

Streams streamsFromJson(String str) => Streams.fromJson(json.decode(str));

String streamsToJson(Streams data) => json.encode(data.toJson());

class Streams {
  Streams({
    this.title,
    this.stream,
    this.description,
    this.author,
    this.availability,
  });

  String? title;
  String? stream;
  String? description;
  String? author;
  bool? availability;

  factory Streams.fromJson(Map<String, dynamic> json) => Streams(
        title: json["title"],
        stream: json["stream"],
        description: json["description"],
        author: json["author"],
        availability: json["availability"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "stream": stream,
        "description": description,
        "author": author,
        "availability": availability,
      };
}
