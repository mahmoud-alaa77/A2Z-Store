import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final String title;
  final double price;
  final String image;
  final int quantity;
  final int productId;
  final String userId;

  CartModel(
      {
      required this.title,
      required this.price,
      required this.image,
      required this.quantity,
      required this.productId,
      required this.userId});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
