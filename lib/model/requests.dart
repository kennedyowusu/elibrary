import 'dart:convert';

List<Requests> requestsListFromJson(String str) =>
    (json.decode(str) as List<dynamic>)
        .map((s) => Requests.fromJson(s))
        .toList();

String requestsListToJson(List<Requests> data) =>
    json.encode(data.map((s) => s.toJson()).toList());

class Requests {
  Requests({
    this.title,
    this.author,
    this.index,
    this.borrowDate,
    this.returnDate,
    this.borrowedBy,
  });

  String? title;
  String? author;
  String? index;
  String? borrowDate;
  String? returnDate;
  String? borrowedBy;

  factory Requests.fromJson(Map<String, dynamic> json) => Requests(
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
