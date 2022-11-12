import 'dart:convert';

List<Category> categoryFromJson(String str) => [
      for (Map<String, dynamic> x in json.decode(str)["data"])
        Category.fromJson(x),
    ];

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  int id;
  String name;
  String icon;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}
