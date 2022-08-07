import 'dart:convert';

List<Retrieve> requestsListFromJson(String str) =>
    (json.decode(str) as List<dynamic>)
        .map((s) => Retrieve.fromJson(s))
        .toList();

String requestsListToJson(List<Retrieve> data) =>
    json.encode(data.map((s) => s.toJson()).toList());

class Retrieve {
  Retrieve({
    required this.title,
    required this.author,
    required this.index,
    required this.borrowDate,
    required this.returnDate,
    required this.borrowedBy,
  });

  String title;
  String author;
  String index;
  String borrowDate;
  String returnDate;
  String borrowedBy;

  factory Retrieve.fromJson(Map<String, dynamic> json) => Retrieve(
        title: json["title"],
        author: json["author"],
        index: json["index"],
        borrowDate: json["borrow_date"],
        returnDate: json["return_date"],
        borrowedBy: json["borrowed_by"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "index": index,
        "borrow_date": borrowDate,
        "return_date": returnDate,
        "borrowed_by": borrowedBy,
      };
}
