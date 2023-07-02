import 'package:json_annotation/json_annotation.dart';
import 'package:store/models/rating.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final Rating? rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
