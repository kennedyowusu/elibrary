import 'dart:convert';

List<Streams> streamsListFromJson(String str) =>
    (json.decode(str) as List<dynamic>)
        .map((s) => Streams.fromJson(s))
        .toList();

String streamsListToJson(List<Streams> data) =>
    json.encode(data.map((s) => s.toJson()).toList());

class Streams {
  Streams({
    required this.image,
    required this.title,
    required this.stream,
    required this.description,
    required this.author,
    required this.availability,
  });

  String image, title, stream, description, author = "";
  bool? availability;
  factory Streams.fromJson(Map<String, dynamic> json) => Streams(
        title: json["title"],
        stream: json["stream"],
        description: json["description"],
        author: json["author"],
        availability: json["availability"],
        image: json["image"],
      );
  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "stream": stream,
        "description": description,
        "author": author,
        "availability": availability,
      };
}
