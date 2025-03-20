// ignore_for_file: non_constant_identifier_names

import '../models/image.dart';

class Product {
  int id;
  String name;
  String description;
  int price;
  int quantity;
  int cate_id;
  List<Image> images;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.cate_id,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'] is String ? int.parse(json['price']) : json['price'],
      quantity: json['quantity'] is String
          ? int.parse(json['quantity'])
          : json['quantity'],
      cate_id: json['cate_id'] is String
          ? int.parse(json['cate_id'])
          : json['cate_id'],
      images: List<Image>.from(json['images'].map((x) => Image.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'cate_id': cate_id,
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}
