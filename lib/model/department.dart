import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.brand,
    required this.name,
    required this.imageLink,
  });

  String name;
  String brand;

  String imageLink;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        brand: json["brand"],
        imageLink: json['image_link'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "imageLink": imageLink,
      };
}
