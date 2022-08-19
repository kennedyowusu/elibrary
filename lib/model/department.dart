// To parse this JSON data, do
//
//     final department = departmentFromJson(jsonString);

import 'dart:convert';

Department departmentFromJson(String str) =>
    Department.fromJson(json.decode(str));

String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
  Department({
    required this.name,
    required this.stream,
    required this.description,
    required this.author,
    required this.availability,
    required this.hod,
    required this.totalNoBooks,
  });

  String name;
  String stream;
  String description;
  String author;
  bool availability;
  String hod;
  int totalNoBooks;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        name: json["name"],
        stream: json["stream"],
        description: json["description"],
        author: json["author"],
        availability: json["availability"],
        hod: json["hod"],
        totalNoBooks: json["totalNoBooks"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "stream": stream,
        "description": description,
        "author": author,
        "availability": availability,
        "hod": hod,
        "totalNoBooks": totalNoBooks,
      };
}
