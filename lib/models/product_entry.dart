// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

ProductEntry productEntryFromJson(String str) =>
    ProductEntry.fromJson(json.decode(str));

String productEntryToJson(ProductEntry data) => json.encode(data.toJson());

class ProductEntry {
  int id;
  String name;
  int price;
  String description;
  int? userId;
  String thumbnail;
  String brand;
  int stock;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.userId,
    required this.thumbnail,
    required this.brand,
    required this.stock,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    userId: json["user_id"],
    thumbnail: json["thumbnail"],
    brand: json["brand"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "user_id": userId,
    "thumbnail": thumbnail,
    "brand": brand,
    "stock": stock,
  };
}
