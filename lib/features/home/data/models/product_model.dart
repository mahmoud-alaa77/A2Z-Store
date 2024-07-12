import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';




@JsonSerializable()
class ProductModel{


  final List<Product> products;

ProductModel({required this.products});

factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}













@JsonSerializable()
class Product {
  final int? id;
  final String? title;
  final String? description;
  final List<String>? images;
  final String? category;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final double? price;
  final String? brand;
  final double? weight;
  @JsonKey(name: "thumbnail")
  final String? mainImage;

  Product(
      {required this.id,
      required this.rating,
      required this.stock,
      required this.tags,
      required this.brand,
      required this.weight,
      required this.mainImage,
      required this.title,
      required this.description,
      required this.images,
      required this.category,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}



