import 'dart:io';

import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String description;
  final double price;
  final String code;
  final bool isFutureProduct;
  final File? image;
  String? imagePath;

  AddProductModel({
    required this.code,
    required this.image,
    required this.isFutureProduct,
    required this.name,
    required this.description,
    required this.price,
    this.imagePath,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      code: entity.code,
      image: entity.image,
      isFutureProduct: entity.isFutureProduct,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      imagePath: entity.imagePath,
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFutureProduct': isFutureProduct,
      'imagePath': imagePath,
    };
  }
}
