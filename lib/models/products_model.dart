// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.categoryName,
    required this.size,
    required this.price,
    required this.description,
    required this.id,
    required this.title,
    required this.category,
  });

  final List image;
  final String categoryName;
  final List size;
  final int price;
  final String description;
  final String id;
  final String title;
  final String category;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"] ?? [],
        categoryName: json["category_name"] ?? '',
        size: json["size"] ?? [],
        price: json["price"] ?? 0,
        description: json["description"] ?? '',
        id: json["id"] ?? '',
        title: json["title"] ?? '',
        category: json["category"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "image": List<dynamic>.from(image.map((x) => x)),
        "category_name": categoryName,
        "size": List<dynamic>.from(size.map((x) => x)),
        "price": price,
        "description": description,
        "id": id,
        "title": title,
        "category": category,
      };
}
