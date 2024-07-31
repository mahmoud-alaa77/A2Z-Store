// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      quantity: (json['quantity'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'userId': instance.userId,
    };
