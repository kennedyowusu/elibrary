// class Book {
//   int? id = 0;
//   String? title = "";
//   String? description = "";
//   String? image = "";
//   String? author = "";
//   bool? isAvailable = false;
//   int? categoryId = 2;
//   bool? isRecommended = false;
//   bool? isPopular = false;

//   Book({
//     this.id,
//     this.title,
//     this.description,
//     this.image,
//     this.author,
//     this.isAvailable,
//     this.categoryId,
//     this.isRecommended,
//     this.isPopular,
//   });

//   Book.fromJson(Map<String, dynamic> parsedJson) {
//     id = parsedJson['id'];
//     title = parsedJson['title'];
//     description = parsedJson['description'];
//     image = parsedJson['image'];
//     author = parsedJson['author'];
//     isAvailable = parsedJson['isAvailable'].toString() == '1' ? true : false;
//     categoryId = parsedJson['category_id'];
//     isRecommended =
//         parsedJson['isRecommended'].toString() == '1' ? true : false;
//     ;
//     isPopular = parsedJson['isPopular'].toString() == '1' ? true : false;
//     ;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['author'] = this.author;
//     data['isAvailable'] = this.isAvailable;
//     data['category_id'] = this.categoryId;
//     data['isRecommended'] = this.isRecommended;
//     data['isPopular'] = this.isPopular;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

// Book bookFromJson(String str) => Book.fromJson(json.decode(str));

// List<Book> bookFromJson(String str) =>
//     (json.decode(str)["data"] as List).map((e) => Book.fromJson(e)).toList();

List<Book> bookFromJson(String str) {
  Iterable jsonArray = json.decode(str);
  return List<Book>.from(jsonArray.map((json) => Book.fromJson(json)));
}

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    this.id,
    this.title,
    this.description,
    this.image,
    this.author,
    this.isAvailable,
    this.categoryId,
    this.isRecommended,
    this.isPopular,
  });

  int? id = 0;
  String? title = "";
  String? description = "";
  String? image = "";
  String? author = "";
  bool? isAvailable = false;
  int? categoryId = 1;
  bool? isRecommended = false;
  bool? isPopular = false;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        author: json["author"],
        isAvailable: json["isAvailable"].toString() == '1' ? true : false,
        categoryId: json["categoryId"],
        isRecommended: json["isRecommended"].toString() == '1' ? true : false,
        isPopular: json["isPopular"].toString() == '1' ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "author": author,
        "isAvailable": isAvailable,
        "categoryId": categoryId,
        "isRecommended": isRecommended,
        "isPopular": isPopular,
      };
}
